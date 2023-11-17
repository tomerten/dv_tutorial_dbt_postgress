import numpy as np
import pandas as pd


def model(dbt, session):
    # dbt configuration
    dbt.config(packages=["pandas", "numpy"])

    # get upstream data
    product_details = dbt.ref("sat_product_details")  # .to_pandas()

    # describe the data
    product_details_wgrp = (
        product_details.groupby(by="prodcategoryid")["weightmeasure"]
        .describe()
        .sort_values(by="mean")
    )
    product_details_wgrp.reset_index(inplace=True)

    return product_details_wgrp.round(2)
