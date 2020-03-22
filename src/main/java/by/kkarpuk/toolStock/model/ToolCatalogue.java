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
public class ToolCatalogue {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private Long toolTypeId;

    @Column
    private String title;

    @Column
    private Date receiptDate;

    @Column
    private Date writeOffDate;

    @Column
    private Date productionDate;

    @Column
    private Integer shelfLife;

    @Column
    private Date deleteDate;

}