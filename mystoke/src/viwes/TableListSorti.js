import React,{Fragment, useEffect, useState } from "react";
import { format } from 'date-fns';
import {
  Card,
  Table,
  Container,
  Row,
  Col,
} from "react-bootstrap";
 
function TableSorti(props) {
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
      const deletesetAciers = await fetch(`/delete/${table}_sortir/${id}`, {
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
      const response = await fetch("/select/"+table+"_sortir");
      const jsonData = await response.json();

      setAciers(jsonData);
    } catch (err) {
      console.error(err.message);
    }
  };
  useEffect(() => {
    getAciers();
  }, []);
  console.log(aciers);

  return (
    <>
      <Container fluid>
        <Row>
          <Col >
            <Card className="card-plain ">
              <Card.Header>
                <Card.Title as="h4">Table {props.tablename} À DÉLIVRER
</Card.Title>
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
                      <th className="border-0">      Date À DÉLIVRER     </th>
                      <th className="border-0">          </th>
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
                      <td >{convertDateTime(acier.date_sorti)}</td>
                      <td></td>

                      <td> <button
                  className="btn btn-danger"
                  onClick={() => deletesetAciers(acier.id)}
                >
                <i class="bi bi-trash"></i> 
                </button> </td>
                    </tr>))}
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

export default TableSorti;
