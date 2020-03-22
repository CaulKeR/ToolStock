package by.kkarpuk.toolStock.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class TechnologicalMap {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private Long toolId;

    @Column
    private Long equipmentId;

    @Column
    private Long workerId;

    @Column
    private Long managerId;

    @Column
    private Date issuingDate;

    @Column
    private Date receptionDate;

}