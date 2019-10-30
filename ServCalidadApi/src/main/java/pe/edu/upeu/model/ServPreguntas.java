/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.*;
import lombok.Data;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 *
 * @author davidmp
 */
@Data
@Entity
@Table(name = "serv_preguntas")
public class ServPreguntas implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_preguntas")
    private Integer idPreguntas;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "nombre_pre")
    private String nombrePre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "estado_pre")
    private String estadoPre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "categoria_pre")
    private String categoriaPre;
    @JoinColumn(name = "id_tipo_alternativa", referencedColumnName = "id_tipo_alternativa")
    @ManyToOne(optional = false)
    private ServTipoalternativa idTipoAlternativa;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPreguntas")
    @JsonIgnore
    private Collection<ServDetalleRespuesta> servDetalleRespuestaCollection;

}
