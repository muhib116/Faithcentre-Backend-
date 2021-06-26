<?php
	if($_FILES["myFiles"]["tmp_name"] == null)
	{
		echo "File Not Found";
	}else{
		$limit 			= count($_FILES["myFiles"]["tmp_name"]);
		$i     			= 0;
		$uploadLocation = "public/backend/media/";
		$temp_name		= $_FILES["myFiles"]["tmp_name"];
		$file_name		= $_FILES["myFiles"]["name"];
		$file_size		= $_FILES["myFiles"]["size"]; // file size in byte

		for($i; $i<$limit; $i++)
		{
			$ext 				 = pathinfo($file_name[$i], PATHINFO_EXTENSION);
			$__fileName 		 = str_replace(' ', '-', pathinfo($file_name[$i], PATHINFO_FILENAME));//without extention
			$img_additional_info = getimagesize($_FILES['myFiles']['tmp_name'][$i]); 
			
			$prev_width  		 = $img_additional_info[0];
			$prev_height 		 = $img_additional_info[1];
			$mime_type   		 = $img_additional_info['mime'];
			$file_name_for_store = $__fileName.time().'.'.$ext;
			$single_temp_name 	 = $temp_name[$i];
			$upload_status		 = 0;
			
			// file upload start--------------------
			if(strpos($mime_type,"image")==0)
			{
				// this for s size
				$upload_status = create_image($single_temp_name, $file_name_for_store, $prev_width, $prev_height, 100, $uploadLocation.'s/', 80, $mime_type);

				// this for m size
				$upload_status = create_image($single_temp_name, $file_name_for_store, $prev_width, $prev_height, 300, $uploadLocation.'m/', 80, $mime_type);

				// this for l size
				$upload_status = create_image($single_temp_name, $file_name_for_store, $prev_width, $prev_height, 500, $uploadLocation.'l/', 80, $mime_type);

				// this for xl size
				$upload_status = create_image($single_temp_name, $file_name_for_store, $prev_width, $prev_height, 700, $uploadLocation.'xl/', 90, $mime_type);
				
				// original image
				copy($single_temp_name, $uploadLocation.'original/'.$file_name_for_store);
			}else{
				$upload_status = uploadFile();
			}
			// file upload end--------------------
			
			if($upload_status)
			{
				$data = [
						"category_id" => $_REQUEST['category_id'],
						"file_name"   => $file_name_for_store,
						"mime_type"   => $mime_type,
						"file_size"   => (($file_size[$i]/1024)/1024),
						"dimensions"  => $prev_width."x".$prev_height,
						"alt_text" 	  => 'Alt Text',
						"title" 	  => 'Title',
						"caption" 	  => 'Caption',
						"description" => 'Description',
						"created_at"  => date("Y-m-d"),
						"updated_at"  => date("Y-m-d")
					];

				
				/*insert data into database start*/
				echo insertToDB($data);
				/*insert data into database end*/
			}
		}
	}




    function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $upload_location, $quality, $mime_type)
    {
        if(!empty($image))
        {
        	switch ($mime_type) {
        		case 'image/jpeg':
        			$img = imagecreatefromjpeg($image);
        			break;
        		case 'image/png':
        			$img = imagecreatefrompng($image);
        			break;
        		case 'image/webp':
        			$img = imagecreatefromwebp($image);
        			break;
        		case 'image/gif':
        			$img = imagecreatefromgif($image);
        			break;
        		default:
        			$img = false;
        			break;
        	}
            // $img   = imagecreatefromstring($image);
            
            
            if($img){
                // calculate image ratio start----------------
                list($new_width, $new_height) = image_ratio($prev_width, $prev_height, $new_width);
                // calculate image ratio end------------------

                $trueColor = imagecreatetruecolor($new_width, $new_height);
                
                // Set the background color of image using 
                // imagecolorallocate() function. 
                
                $bg = imagecolorallocate($trueColor, 255, 255, 255);

                if($mime_type=='image/png')
                {
	                $bg = imagecolorallocate($trueColor, 255, 255, 255,);
	                imagecolortransparent($trueColor, $bg);
                }

                // Fill background with above selected color.
                imagefill($trueColor, 0, 0, $bg);
                
                // copy image to this 
                imagecopyresampled($trueColor, $img, 0, 0, 0, 0, $new_width, $new_height, $prev_width, $prev_height);
                




                // now create imge to specific location
                switch ($mime_type) {
	        		case 'image/jpeg':
	        			imagejpeg($trueColor, $upload_location."/".$img_name, $quality);
	        			break;
	        		case 'image/png':
	        			imagepng($trueColor, $upload_location."/".$img_name, 9); //png support 0-9 as quality
	        			break;
	        		case 'image/webp':
                		imagewebp($trueColor, $upload_location."/".$img_name, $quality);
	        			break;
	        		case 'image/gif':
	        			imagegif($trueColor, $upload_location."/".$img_name, $quality);
	        			break;
	        		default:
	        			$img = false;
	        			break;
	        	}





                // free memory
                imagedestroy($trueColor); 
            }
            return $img_name;
        }else{
            return null;
        }

    }

    function image_ratio($prev_width, $prev_height,$new_width){
        return [$new_width, (($prev_height/$prev_width)*$new_width)];
    }

    function insertToDB($data)
    {
		/*database connection start*/
			$servername = "localhost";
			$db_name 	= "muhikgzv_fath_center_db";
			$username 	= "muhikgzv_fath_center_db";
			$password 	= "muhikgzv_fath_center_db";

			// Create connection
			$conn = new mysqli($servername, $username, $password, $db_name);

			// Check connection
			if ($conn->connect_error) {
			  die("Connection failed: " . $conn->connect_error);
			}
			// echo "Connected successfully";
		/*database connection end*/


    	$sql = "INSERT INTO media (";
    	foreach($data as $key => $value)
    	{
    		$sql .= $key.",";
    	}

    	$sql  = substr($sql, 0, -1);
    	$sql .= ") VALUES (";

    	foreach($data as $key => $value)
    	{
    		$sql .= "'".$value."',";
    	}

    	$sql  = substr($sql, 0, -1);
    	$sql .= ")";

		if ($conn->query($sql) === TRUE) {
		  $status = 1;
		} else {
		  $status = 0;
		}

		$conn->close();
		return $status;
    }