import React ,{ useRef } from 'react';
import Navbar from './Navbar';
import TableList from '../viwes/TableList';
import ReactToPrint from 'react-to-print';
import QRCode from "qrcode.react"
import '../viwes/Tiket'

import {
  Button,
  Card,
  Form,
  Row,
  Col,
  Table,
} from 'react-bootstrap';
import CardHeader from 'react-bootstrap/esm/CardHeader';
import { useState , useEffect } from 'react';
import Tiket from '../viwes/Tiket';
function AjouterAcier() {
  
  const componentRef = useRef();
  const currentDate = new Date();
  const year = currentDate.getFullYear();
  const month = String(currentDate.getMonth() + 1).padStart(2, '0');
  const day = String(currentDate.getDate()).padStart(2, '0');
  const hours = String(currentDate.getHours()).padStart(2, '0');
  const minutes = String(currentDate.getMinutes()).padStart(2, '0');
  const seconds = String(currentDate.getSeconds()).padStart(2, '0');
  
  const formattedDateTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
 
  const [id1, setId1] = useState([]);
  const [id2, setId2] = useState([]);
  const [id3, setId3] = useState([]);
  const [id4, setId4] = useState([]);
  const getid1 = async () =>{
    try {
      const response1 = await fetch("/max/BILLETTES");
      const jsonData = await response1.json();
      setId1(jsonData);
    } catch (err) {
      console.error(err.message);}
  
    }
    const getid2 = async () =>{
      try {
        const response1 = await fetch("/max/ROND_A_BETON");
        const jsonData = await response1.json();
        setId2(jsonData);
      } catch (err) {
        console.error(err.message);}
    
      }
      const getid3 = async () =>{
        try {
          const response1 = await fetch("/max/FILS");
          const jsonData = await response1.json();
          setId3(jsonData);
        } catch (err) {
          console.error(err.message);}
      
        }
        const getid4 = async () =>{
          try {
            const response1 = await fetch("/max/STRUCTURES_METALIQUES");
            const jsonData = await response1.json();
            setId4(jsonData);
          } catch (err) {
            console.error(err.message);}
        
          }
         const [formData, setFormData] = useState({
    id:'',
    Table: '',
    diametre: '',
    botte: '',
    coulee: '',
    poids: '',
    dateFabrication:'',
    agent: 'montassar34',
    localisation: '',
  });
          useEffect(() => {
            getid1();
            getid2();
            getid3();
            getid4();
        
            // Initialize the ID based on the default selected value
           
          }, []);
           
    /*console.log(id1);
    console.log(id2);
    console.log(id3);
    console.log(id4);
  */

    const handleChange = (e) => {
      let newId = "";
      const { name, value } = e.target;       
      if (value === "BILLETTES") {
        newId = id1.max_id;
      } else if (value === "ROND_A_BETON") {
        newId = id2.max_id;
      } else if (value === "FILS") {
        newId = id3.max_id;
      } else if (value === "STRUCTURES_METALIQUES") {
        newId = id4.max_id;
      } 
      else{
        newId=formData.id;
      }   
      setFormData((prevData) => ({
        ...prevData, 
        [name]: value,
        id: newId,
        dateFabrication:formattedDateTime,
      }));
      };
    
  
      const [qrText, setQRText] = useState('');
      const [showQRCode, setShowQRCode] = useState(false);
      
        
        const handleSubmit = async (e) => {
          
        e.preventDefault();
        const {
          id,
          Table,
          diametre,
          botte,
          coulee,
          poids,
          dateFabrication,
          agent,
          localisation,
        } = formData;
        const qrText = `${formData.id}/${diametre}/${botte}/${coulee}/${poids} /${dateFabrication}/${"Montassar Tayachi"}/${localisation}/${Table}`;
        setQRText(qrText);
        setShowQRCode(true);
        
        
       
        try {

          const body = {diametre,botte,coulee,poids,dateFabrication,agent,localisation };
          const response = await fetch("/insert/"+Table, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(body)
          });
    
         
        } catch (err) {
          console.error(err.message);
        }  
      
      };
     
    
  return (
    <div>
      <Navbar Navbarname="Acier" />
     
        <Row className='m-2  bg-light'>
          <Col >
            <Card>
              <Card.Header>
                <Card.Title as="h4">Ajouter Acier</Card.Title>
              </Card.Header>
              <Card.Body>
                <Form onSubmit={handleSubmit}>
                  <Row className='m-3'>
                    <Col className="pr-1" >
                      {/* Use <Col>, not <col> */}
                      <label>Produit</label>
                      <Form.Select
  size="lg"
  name="Table"
  value={formData.Table}
  onChange={handleChange}
  required
>
  <option value="/">Select Acier</option>
  <option value="BILLETTES">BILLETTES</option>
  <option value="ROND_A_BETON">ROND_A_BETON</option>
  <option value="FILS">FILS</option>
  <option value="STRUCTURES_METALIQUES">STRUCTURES_METALIQUES</option>
</Form.Select>
                    </Col>
                    <Col className="px-1">
                      <Form.Group>
                        <label>Diamètre</label>
                        <Form.Control
                          placeholder="Diamètre"
                          type="number"
                          name="diametre"
                           value={formData.diametre} 
                           onChange={handleChange} required 
                        />
                      </Form.Group>
                    </Col>
                    <Col className="pl-1">
                      <Form.Group>
                        <label>Botte N°</label>
                        <Form.Control
                          placeholder="Botte N°"
                          type="text"
                          name="botte"
                          value={formData.botte} 
                          onChange={handleChange} required 
                        />
                      </Form.Group>
                    </Col>
                  </Row>
                  <Row className='m-3'>
                    <Col className="pr-1">
                      <Form.Group>
                        <label>Coulée N°</label>
                        <Form.Control
                          placeholder="Coulée N°"
                          type="text"
                          name="coulee"
                          value={formData.coulee} 
                          onChange={handleChange} required 
                        />
                      </Form.Group>
                    </Col>
                    <Col className="pl-1" >
                      <Form.Group>
                        <label>Poid(KG)</label>
                        <Form.Control
                          placeholder="Poid(KG)"
                          type="number"
                          name="poids"
                          value={formData.poids} 
                          onChange={handleChange} required
                        />
                      </Form.Group>
                    </Col>
                    <Col className="pl-1" >
                      <Form.Group>
                        <label>localisation</label>
                        <Form.Control
                          placeholder="localisation"
                          type="TEXT"
                          name="localisation"
                          value={formData.localisation} 
                          onChange={handleChange} required
                        />
                      </Form.Group>
                    </Col>
                  </Row>
                 
                 
                  <Button
                  className="btn btn-primary    mx-4 px-5 flex-grow-1"
                  type="submit"
                >
                  Save
                </Button>
                  </Form>
              </Card.Body>
              
            </Card>
         </Col>
          <Col >
          <Card className='m-0 px-0'>
            <CardHeader>  <Card.Title as="h4">You Ticket</Card.Title></CardHeader>
            <Card.Body>
            <div className='m-1'>
        <Tiket ref={componentRef}  date={formData.dateFabrication} ag={formData.agent} tablename={formData.Table} position={formData.localisation}  qrcode={qrText} 
        diametre={formData.diametre} id ={formData.id} Bolle={formData.botte} Coullee={formData.coulee} Poid={formData.poids} 
        />
      </div>
            </Card.Body>
         
      
          </Card>
        
    

        
          </Col>
        </Row>
      <div>
      <div className='row m-2' > <TableList tablename="BILLETTES"/></div>
    <div className='row m-2'> <TableList tablename="ROND A BETON"/></div>
    <div className='row m-2'> <TableList tablename="FILS"/></div>
    <div className='row m-2'> <TableList tablename="STRUCTURES METALIQUES"/></div>
      </div>
    </div>
  );
}

export default AjouterAcier;
