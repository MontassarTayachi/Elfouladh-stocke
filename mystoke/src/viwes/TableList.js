import React,{Fragment, useEffect, useState } from "react";
import { format } from 'date-fns'; // Import date-fns library for date formatting

import {
  
  Card,

  Table,
  Container,
  Row,
  Col,
} from "react-bootstrap";
 
function TableList(props) {
  const [aciers, setAciers] = useState([]);

  const deletesetAciers = async id => {
    if(props.tablename =="BILLETTES")
    var table= "BILLETTES";
  else if(props.tablename =="ROND A BETON")
     table="ROND_A_BETON";
  else if(props.tablename =="FILS")
     table="FILS";
  else if(props.tablename=="STRUCTURES METALIQUES")
     table="STRUCTURES_METALIQUES";  
    try {
      const deletesetAciers = await fetch(`/delete/${table}/${id}`, {
        method: "DELETE"
      });

      setAciers(aciers.filter(acier => acier.id !== id));
    } catch (err) {
      console.error(err.message);
    }
  };
  
  function convertDateTime(inputDateTime) {
    const parsedDateTime = new Date(inputDateTime);
    const formattedDateTime = format(parsedDateTime, 'dd-MM-yyyy HH:mm:ss');
    return formattedDateTime;
  }
  
  const getAciers = async () => {
    if(props.tablename =="BILLETTES")
    var table= "BILLETTES";
  else if(props.tablename =="ROND A BETON")
     table="ROND_A_BETON";
  else if(props.tablename =="FILS")
     table="FILS";
  else if(props.tablename=="STRUCTURES METALIQUES")
     table="STRUCTURES_METALIQUES";  
    try {
      const response = await fetch("/select/"+table);
      const jsonData = await response.json();

      setAciers(jsonData);
    } catch (err) {
      console.error(err.message);
    }
  };
  useEffect(() => {
    getAciers();
  }, []);
  //console.log(aciers);
  const currentDate = new Date();
    const day = currentDate.getDate().toString().padStart(2, '0');
    const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
    const year = currentDate.getFullYear().toString().slice(2);
    const hours = currentDate.getHours().toString().padStart(2, '0');
    const minutes = currentDate.getMinutes().toString().padStart(2, '0');
    const seconds = currentDate.getSeconds().toString().padStart(2, '0');
    const formattedDateTime = `${day}-${month}-${year} ${hours}:${minutes}:${seconds}`;
    const date_sorti=formattedDateTime;
  return (
    <>
      <Container fluid>
        <Row>
          <Col >
            <Card className="card-plain ">
              <Card.Header>
                <Card.Title as="h4">Table {props.tablename} </Card.Title>
              </Card.Header>
              <Card.Body className="table-full-width table-responsive px-0">
                <Table className="table-hover">
                  <thead>
                    <tr>
                      <th className="border-0">ID</th>
                      <th className="border-0">Diametre</th>
                      <th className="border-0">Botte</th>
                      <th className="border-0">Coulee</th>
                      <th className="border-0">Poids</th>
                      <th className="border-0">Date fabrication</th>
                      <th className="border-0">Agent</th>
                      <th className="border-0">Localisation</th>
                      <th className="border-0">           </th>
                    </tr>
                  </thead>
                  <tbody>
                  {aciers.map(acier => (
                    <tr  key={acier.id}>
                      <td >{acier.id}</td>
                      <td >{acier.diametre}</td>
                      <td>{acier.botte}</td>
                      <td >{acier.coulee}</td>
                      <td >{acier.poids} Kg</td>
                      <td>{convertDateTime(acier.datefabrication)}</td>
                      <td>{acier.agent}</td>
                      <td >{acier.localisation}</td>
                      <td> 
                        <button
                  className="btn btn-danger"
                  onClick={() => deletesetAciers(acier.id)}
                >
                <i class="bi bi-trash"></i> 
                </button>  <button
                  className="btn btn-success"
                  onClick={async () =>{ 
                    if(props.tablename =="BILLETTES")
                    var table= "BILLETTES";
                  else if(props.tablename =="ROND A BETON")
                     table="ROND_A_BETON";
                  else if(props.tablename =="FILS")
                     table="FILS";
                  else if(props.tablename=="STRUCTURES METALIQUES")
                     table="STRUCTURES_METALIQUES"; 
                     try {
                      const body = {
                        diametre: acier.diametre,
                        botte: acier.botte,
                        coulee: acier.coulee,
                        poids: acier.poids,
                        dateFabrication: acier.datefabrication,
                        agent: acier.agent,
                        localisation: acier.localisation,
                        date_sorti: date_sorti ,// Use the defined variable
                        id:acier.id,
                      };
                      const response = await fetch(`/insert/${table}_sortir`, {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify(body)
                      });
                
                     
                    } catch (err) {
                      console.error(err.message);
                    }  
                    
                    
                    
                    
                    deletesetAciers(acier.id)}
                }
                >
                <i class="bi bi-truck"></i> 
                </button> </td>
                    </tr>
                    
                    
                    ))}
                  </tbody>
                </Table>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      </Container>
    </>
  );
}

export default TableList;
