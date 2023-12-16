const express = require("express");
const cors = require("cors");
const app = express();
const pool = require("./db");
app.use(express.json());
app.use(cors());

app.post("/insert/BILLETTES", async (req, res) => {
        try {
          const { diametre, botte, coulee, poids, dateFabrication, agent, localisation } = req.body;
          const newBILLETTES = await pool.query(
            "INSERT INTO BILLETTES (diametre, botte, coulee, poids, dateFabrication,agent,localisation) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *",
            [diametre, botte, coulee, poids, dateFabrication, agent, localisation]
          );
            res.json(newBILLETTES.rows[0]);
        } catch (err) {
         console.error(err.message);
        } });

app.post("/insert/ROND_A_BETON", async (req, res) => {
            try {
              const { diametre, botte, coulee, poids, dateFabrication, agent, localisation } = req.body;
              const newBILLETTES = await pool.query(
                "INSERT INTO ROND_A_BETON (diametre, botte, coulee, poids, dateFabrication, agent, localisation) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *",
                [diametre, botte, coulee, poids, dateFabrication, agent, localisation]
              );
                res.json(newBILLETTES.rows[0]);
            } catch (err) {
             console.error(err.message);
            } });

app.post("/insert/FILS", async (req, res) => {
                try {
                  const { diametre, botte, coulee, poids, dateFabrication, agent, localisation } = req.body;
                  const newBILLETTES = await pool.query(
                    "INSERT INTO FILS (diametre, botte, coulee, poids, dateFabrication, agent, localisation) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *",
                    [diametre, botte, coulee, poids, dateFabrication, agent, localisation]
                  );
                    res.json(newBILLETTES.rows[0]);
                } catch (err) {
                 console.error(err.message);
                } });

app.post("/insert/STRUCTURES_METALIQUES", async (req, res) => {
                    try {
                      const { diametre, botte, coulee, poids, dateFabrication, agent, localisation } = req.body;
                      const newBILLETTES = await pool.query(
                        "INSERT INTO STRUCTURES_METALIQUES (diametre, botte, coulee, poids, dateFabrication, agent, localisation) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *",
                        [diametre, botte, coulee, poids, dateFabrication, agent, localisation]
                      );
                        res.json(newBILLETTES.rows[0]);
                    } catch (err) {
                     console.error(err.message);
                    } });

app.get("/select/BILLETTES", async (req, res) => {
  try {
    const allTodos = await pool.query("SELECT * FROM BILLETTES order by dateFabrication DESC");
    res.json(allTodos.rows);
  } catch (err) {
    console.error(err.message);
  }
});

app.get("/select/ROND_A_BETON", async (req, res) => {
    try {
      const allTodos = await pool.query("SELECT * FROM rond_a_beton order by dateFabrication DESC");
      res.json(allTodos.rows);
    } catch (err) {
      console.error(err.message);
    }
  });

app.get("/select/FILS", async (req, res) => {
    try {
      const allTodos = await pool.query("SELECT * FROM FILS order by dateFabrication DESC");
      res.json(allTodos.rows);
    } catch (err) {
      console.error(err.message);
    }
  });


  app.get("/select/STRUCTURES_METALIQUES", async (req, res) => {
    try {
      const allTodos = await pool.query("SELECT * FROM STRUCTURES_METALIQUES order by dateFabrication DESC");
      res.json(allTodos.rows);
    } catch (err) {
      console.error(err.message);
    }
  });

  app.get("/select/BILLETTES/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const todo = await pool.query("SELECT * FROM BILLETTES WHERE id = $1", [
        id
      ]);
  
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });

  app.get("/select/ROND_A_BETON/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const todo = await pool.query("SELECT * FROM ROND_A_BETON WHERE id = $1", [
        id
      ]);
  
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });

  app.get("/select/FILS/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const todo = await pool.query("SELECT * FROM FILS WHERE id = $1", [
        id
      ]);
  
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });

  app.get("/select/STRUCTURES_METALIQUES/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const todo = await pool.query("SELECT * FROM STRUCTURES_METALIQUES WHERE id = $1", [
        id
      ]);
  
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });

  app.delete("/delete/BILLETTES/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const deleteTodo = await pool.query("DELETE FROM BILLETTES WHERE id = $1", [
        id
      ]);
      res.json("Todo was deleted!");
    } catch (err) {
      console.log(err.message);
    }
  });

  app.delete("/delete/ROND_A_BETON/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const deleteTodo = await pool.query("DELETE FROM ROND_A_BETON WHERE id = $1", [
        id
      ]);
      res.json("Todo was deleted!");
    } catch (err) {
      console.log(err.message);
    }
  });


  app.delete("/delete/FILS/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const deleteTodo = await pool.query("DELETE FROM FILS WHERE id = $1", [
        id
      ]);
      res.json("Todo was deleted!");
    } catch (err) {
      console.log(err.message);
    }
  });

  
  app.delete("/delete/STRUCTURES_METALIQUES/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const deleteTodo = await pool.query("DELETE FROM STRUCTURES_METALIQUES WHERE id = $1", [
        id
      ]);
      res.json("Todo was deleted!");
    } catch (err) {
      console.log(err.message);
    }
  });

  app.get("/sum/BILLETTES", async (req, res) => {
    try {
      const todo = await pool.query("SELECT SUM(poids) AS somme_poids, COUNT(*) AS nombre_total_lignes FROM BILLETTES;");
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });
  app.get("/sum/ROND_A_BETON", async (req, res) => {
    try {
      const todo = await pool.query("SELECT SUM(poids) AS somme_poids, COUNT(*) AS nombre_total_lignes FROM ROND_A_BETON;");
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });
  app.get("/sum/FILS", async (req, res) => {
    try {
      const todo = await pool.query("SELECT SUM(poids) AS somme_poids, COUNT(*) AS nombre_total_lignes FROM FILS;");
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });
  app.get("/sum/STRUCTURES_METALIQUES", async (req, res) => {
    try {
      const todo = await pool.query("SELECT SUM(poids) AS somme_poids, COUNT(*) AS nombre_total_lignes FROM STRUCTURES_METALIQUES;");
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });


////Tablesorte
app.get("/select/BILLETTES_sortir", async (req, res) => {
  try {
    const allTodos = await pool.query("SELECT * FROM BILLETTES_sortir order by date_sorti DESC");
    res.json(allTodos.rows);
  } catch (err) {
    console.error(err.message);
  }
});

app.get("/select/ROND_A_BETON_sortir", async (req, res) => {
    try {
      const allTodos = await pool.query("SELECT * FROM rond_a_beton_sortir order by date_sorti DESC");
      res.json(allTodos.rows);
    } catch (err) {
      console.error(err.message);
    }
  });

app.get("/select/FILS_sortir", async (req, res) => {
    try {
      const allTodos = await pool.query("SELECT * FROM FILS_sortir order by date_sorti DESC");
      res.json(allTodos.rows);
    } catch (err) {
      console.error(err.message);
    }
  });


  app.get("/select/STRUCTURES_METALIQUES_sortir ", async (req, res) => {
    try {
      const allTodos = await pool.query("SELECT * FROM STRUCTURES_METALIQUES_sortir order by date_sorti DESC");
      res.json(allTodos.rows);
    } catch (err) {
      console.error(err.message);
    }
  });


  app.delete("/delete/BILLETTES_sortir/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const deleteTodo = await pool.query("DELETE FROM BILLETTES_sortir WHERE id = $1", [
        id
      ]);
      res.json("Todo was deleted!");
    } catch (err) {
      console.log(err.message);
    }
  });

  app.delete("/delete/ROND_A_BETON_sortir/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const deleteTodo = await pool.query("DELETE FROM ROND_A_BETON_sortir WHERE id = $1", [
        id
      ]);
      res.json("Todo was deleted!");
    } catch (err) {
      console.log(err.message);
    }
  });


  app.delete("/delete/FILS_sortir/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const deleteTodo = await pool.query("DELETE FROM FILS_sortir WHERE id = $1", [
        id
      ]);
      res.json("Todo was deleted!");
    } catch (err) {
      console.log(err.message);
    }
  });

  
  app.delete("/delete/STRUCTURES_METALIQUES_sortir/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const deleteTodo = await pool.query("DELETE FROM STRUCTURES_METALIQUES_sortir WHERE id = $1", [
        id
      ]);
      res.json("Todo was deleted!");
    } catch (err) {
      console.log(err.message);
    }
  });


  app.post("/insert/BILLETTES_sortir", async (req, res) => {
    try {
      const { diametre, botte, coulee, poids, dateFabrication, agent, localisation ,date_sorti,id} = req.body;
      const newBILLETTES = await pool.query(
        "INSERT INTO BILLETTES_sortir (diametre, botte, coulee, poids, dateFabrication, agent, localisation , date_sorti,id) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING *",
        [diametre, botte, coulee, poids, dateFabrication, agent, localisation,date_sorti,id]
      );
        res.json(newBILLETTES.rows[0]);
    } catch (err) {
     console.error(err.message);
    } });

app.post("/insert/ROND_A_BETON_sortir", async (req, res) => {
        try {
          const { diametre, botte, coulee, poids, dateFabrication, agent, localisation ,date_sorti,id} = req.body;
          const newBILLETTES = await pool.query(
            "INSERT INTO ROND_A_BETON_sortir (diametre, botte, coulee, poids, dateFabrication, agent, localisation,date_sorti,id) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING *",
            [diametre, botte, coulee, poids, dateFabrication, agent, localisation,date_sorti,id]
          );
            res.json(newBILLETTES.rows[0]);
        } catch (err) {
         console.error(err.message);
        } });

app.post("/insert/FILS_sortir", async (req, res) => {
            try {
              const { diametre, botte, coulee, poids, dateFabrication, agent, localisation ,date_sorti,id} = req.body;
              const newBILLETTES = await pool.query(
                "INSERT INTO FILS_sortir (diametre, botte, coulee, poids, dateFabrication, agent, localisation,date_sorti,id) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING *",
                [diametre, botte, coulee, poids, dateFabrication, agent, localisation,date_sorti,id]
              );
                res.json(newBILLETTES.rows[0]);
            } catch (err) {
             console.error(err.message);
            } });

app.post("/insert/STRUCTURES_METALIQUES_sortir", async (req, res) => {
                try {
                  const { diametre, botte, coulee, poids, dateFabrication, agent, localisation ,date_sorti,id} = req.body;
                  const newBILLETTES = await pool.query(
                    "INSERT INTO STRUCTURES_METALIQUES_sortir (diametre, botte, coulee, poids, dateFabrication, agent, localisation,date_sorti,id) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING *",
                    [diametre, botte, coulee, poids, dateFabrication, agent, localisation,date_sorti,id]
                  );
                    res.json(newBILLETTES.rows[0]);
                } catch (err) {
                 console.error(err.message);
                } });


                app.get("/max/BILLETTES", async (req, res) => {
                  try {
                    const todo = await pool.query("SELECT MAX(id)+1 AS MAX_id FROM BILLETTES;");
                    res.json(todo.rows[0]);
                  } catch (err) {
                    console.error(err.message);
                  }
                });
                app.get("/max/ROND_A_BETON", async (req, res) => {
                  try {
                    const todo = await pool.query("SELECT MAX(id)+1 AS MAX_id FROM ROND_A_BETON;");
                    res.json(todo.rows[0]);
                  } catch (err) {
                    console.error(err.message);
                  }
                });
                app.get("/max/FILS", async (req, res) => {
                  try {
                    const todo = await pool.query("SELECT MAX(id)+1 AS MAX_id  FROM FILS;");
                    res.json(todo.rows[0]);
                  } catch (err) {
                    console.error(err.message);
                  }
                });
                app.get("/max/STRUCTURES_METALIQUES", async (req, res) => {
                  try {
                    const todo = await pool.query("SELECT MAX(id)+1 AS MAX_id  FROM STRUCTURES_METALIQUES;");
                    res.json(todo.rows[0]);
                  } catch (err) {
                    console.error(err.message);
                  }
                });
              
              








app.listen(4000, () => console.log("Server on localhost:4000"));
