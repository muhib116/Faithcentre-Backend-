class Chart{
    constructor({data, label, color=[], chartType, target, backgroundColor})
    {
        this.lineWidth   = 2;
        this.lineCap     = 'rounded';
        this.strokeStyle = '#03a9f4';
        this.fillStyle   = '#03a9f4';
        this.colors      = color;

        this.data      = data;
        this.label     = label;

        this.chartType = chartType;
        this.target    = target;

        
        this.generateCanvas();
        this.drawChartBasic();
    }

    generateCanvas = ()=>{
        this.canvasHeight = this.target.offsetHeight;
        this.canvasWidth  = this.target.offsetWidth;
        this.canvas       = document.createElement('canvas');
        this.ctx          = this.canvas.getContext('2d');

        this.canvas.height = this.canvasHeight;
        this.canvas.width  = this.canvasWidth;
        this.canvas.style.backgroundColor = this.backgroundColor;
        this.target.append(this.canvas);
    }
    
    
    ArraySort = (dataCopy)=>{
        return  dataCopy.sort((a,b)=>{
                    return a-b;
                })[this.data.length-1];
    }


    drawChartBasic = ()=>
    {
        let maxDataValue = this.ArraySort([...this.data]); //here i have create a copy of my original data
        let labelLength  = this.label.length;

        console.log(this.canvasHeight/maxDataValue);

        this.avarageDistanceInXCordinet = (this.canvasWidth/labelLength);
        this.avarageDistanceInYCordinet = ((this.canvasHeight-25)/(maxDataValue));

        for(let i=0; i<labelLength; i++)
        {
            this.drawPath([this.avarageDistanceInXCordinet*i, 0], [this.avarageDistanceInXCordinet*i, this.canvasHeight], '#0001', 1);

            if(i==0){
                this.printText((this.avarageDistanceInXCordinet*i+25), this.label[i]);
            }else{
                this.printText((this.avarageDistanceInXCordinet*i+6), this.label[i]);
            }
        }

        this.printDataIntoChart();
    };


    printDataIntoChart = ()=>
    {
        this.data.forEach((data, index)=>
        {
            let x1 = this.avarageDistanceInXCordinet*index;
            let y1 = (typeof(parseInt(data)) === 'number') ? (this.avarageDistanceInYCordinet * parseInt(data)) : 0;

            let x2 = this.avarageDistanceInXCordinet*(index+1);
            let y2 = (this.data[index+1] !== undefined && typeof(parseInt(this.data[index+1]) === 'number')) ? (this.avarageDistanceInYCordinet * parseInt(this.data[index+1])) : 0;

            if(index === 0)
            {
                this.drawPath([x1+15, (y1+15)], [x2, (y2+15)]);
                this.drawCircle(x1+15,(y1+15), 4, this.colors[index]);
            }else{
                this.drawPath([x1, (y1+15)], [x2, (y2+15)]);
                this.drawCircle(x1,(y1+15), 4, this.colors[index]);
            }
        });
    }



    drawPath = (from=[0,0], to=[0,0], color = this.strokeStyle, lineWidth=this.lineWidth)=>
    {
        this.ctx.strokeStyle = color;
        this.ctx.lineWidth   = lineWidth;
        this.ctx.lineCap     = this.lineCap;
        this.ctx.beginPath();
        this.ctx.moveTo(from[0], (this.canvasHeight-from[1]));
        this.ctx.lineTo(to[0], (this.canvasHeight-to[1]));
        this.ctx.stroke();
    }


    drawCircle = (x,y,r,color)=>{
        this.ctx.fillStyle = color;
        this.ctx.beginPath();
        this.ctx.arc(x,this.canvas.height-y,r, 0, 2*Math.PI);
        this.ctx.fill();
        this.ctx.closePath();
    }

    printText = (x,text)=>
    {
        this.ctx.fillStyle = "#0009";
        this.textWidth  = this.ctx.measureText(text).width;
        this.textHeight = this.ctx.measureText(text).height;
        this.ctx.font = "10px arial";
        this.ctx.fillText(text.toUpperCase(), (x-this.textWidth), this.canvas.height);
    }
};