import React ,{Fragment}from 'react'
import QRCode from "qrcode.react"
import '../App.css'
import  image  from '../Composent/Elfoulath.png'
function Tiket(props) {
   
  const handlePrintAndReload = () => {
    // Open the print dialog
    window.print();

    // Reload the page after printing
    setTimeout(() => {
      window.location.reload();
    }, 1000); // Adjust the delay as needed
  };
      const handleReload2 = () => {
        window.location.reload(); // Cette ligne recharge la page
      };

  return (
    <Fragment>
      <div id='aa'>
        <div   className='ticket'> 
     
     <div > 
         <div  className=" flex justify-content-center align-items-center mt-3 ">
         <p className= "vertical  " style={{ color: '#2b2a2a' }}>  {props.tablename}   {props.id}</p>
             
               
                   
                    
                         <div className=" d-flex text-black ms-1">                           
                            <div class="qr-code" className="ms-5 me-2 ">
                            <h5 className="">Elfoulath</h5>
                            <QRCode  value={props.qrcode}  size={120}
            bgColor={"#ffffff"}
            fgColor={"#000000"}
            level={"H"}
            includeMargin={false}
            imageSettings={{
              src:image,
              x: undefined,
              y: undefined,
              height: 50,
              width: 50,
              excavate: true,
            }} />   </div>                             
                             
                             <div className='col' >
                                 <div className='row'>
                                 <div className='col'>
                                       <p className="fs-6 text-body ">Diamétre</p>
                                       <p className=""> {props.diametre}</p>
                                  </div>
                                  <div className="col">
                                       <p className="fs-6 text-body ">Bolle</p>
                                       <p class="">{props.Bolle}</p>
                                 </div>
                                  <div className='col'>
                                  <p className="fs-6 text-body">Coullée</p>
                                  <p class="">{props.Coullee}</p>
                                 </div>
                                 </div>
                                 <div className='row'>
                                 <div className='col'>
                                       <p className="fs-6 text-body ">Poid</p>
                                       <p className="">{props.Poid} kg</p>
                                  </div>
                                  <div className="col">
                                       <p className="fs-6 text-body ">Date Fabrication </p>
                                       <p class="">{props.date}</p>
                                 </div>
                                  <div className='col'>
                                  <p className="fs-6 text-body">Agent</p>
                                  <p class=""> {props.ag}</p>
                                 </div>
                                 </div>
                           
                             </div>      
                         </div>
                     

            
         </div>
     </div>    
 </div>
 <div className="d-flex pt-1">
                   <button id='bb' type="button" className="btn btn-outline-primary me-1 flex-grow-1" onClick={handlePrintAndReload}>Print</button>
                   <button id='bb' type="button" className="btn btn-primary flex-grow-1"onClick={handleReload2} > Cancel</button>
                 </div>
                 </div>
    </Fragment>
         )
}

export default Tiket




