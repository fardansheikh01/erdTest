-- =============================================
-- DIM_ADDRESS with business context comments
-- =============================================
CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_ADDRESS (
    ADDRESS_KEY NUMBER(38,0) COMMENT 'Surrogate key generated using hashed ADDRESS_ID',
    ADDRESS_ID NUMBER(38,0) COMMENT 'Primary key representing unique address identifier',
    ADDRESS_NAME VARCHAR COMMENT 'Label or display name of the address',
    LINE_ONE VARCHAR COMMENT 'Primary address line (street number, name)',
    LINE_TWO VARCHAR COMMENT 'Secondary address line (e.g., Apt #, Suite)',
    CITY VARCHAR COMMENT 'City of the address',
    STATE_ID VARCHAR(2) COMMENT 'Two-character identifier for the state',
    POSTAL_CODE VARCHAR COMMENT 'ZIP or postal code',
    COUNTRY_ISO VARCHAR(2) COMMENT 'ISO country code (e.g., US, CA)',
    GCADDRESS VARCHAR COMMENT 'Geocoded full address string',
    GCCITY VARCHAR COMMENT 'Geocoded city',
    GCSTATE VARCHAR COMMENT 'Geocoded state',
    GCZIP VARCHAR COMMENT 'Geocoded ZIP code',
    GCLAT VARCHAR COMMENT 'Geocoded latitude',
    GCLONG VARCHAR COMMENT 'Geocoded longitude',
    GCCOUNTY VARCHAR COMMENT 'Geocoded county',
    GCMATCH VARCHAR COMMENT 'Match status of geocode operation',
    GCFIPS VARCHAR COMMENT 'Geocoded FIPS code for county/state',
    GEOCODE_QUALITY VARCHAR COMMENT 'Quality score or category of geocode',
    GC_HASH_KEY VARCHAR COMMENT 'Hash used during geocode processing',
    RELOCATE_USER_ID NUMBER(38,0) COMMENT 'User ID who triggered relocation',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record creation timestamp',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record last update timestamp'
);

-- =============================================
-- DIM_ZIPCODES with business context comments
-- =============================================

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_ZIPCODES (
    ZIP_KEY NUMBER(38,0) COMMENT 'Surrogate key generated from hashed ZIPCODE',
    ZIPCODE VARCHAR(5) COMMENT 'Primary key ZIP code (5-digit)',
    NAME VARCHAR COMMENT 'Name associated with ZIP code',
    FIPS_STATE_CODE VARCHAR(2) COMMENT 'FIPS code identifying the state',
    FIPS_COUNTY_CODE VARCHAR(6) COMMENT 'FIPS code identifying the county',
    LATITUDE NUMBER(38,0) COMMENT 'Latitude of the ZIP code center',
    LONGITUDE NUMBER(38,0) COMMENT 'Longitude of the ZIP code center',
    STATE_ABBREV VARCHAR COMMENT 'State abbreviation (e.g., NY, TX)',
    CITY VARCHAR COMMENT 'City name in ZIP code area',
    COUNTY VARCHAR COMMENT 'County name in ZIP code area',
    AREA_CODE VARCHAR COMMENT 'Telephone area code',
    PLACE_FIPS VARCHAR COMMENT 'FIPS code of the place',
    MSA_CODE VARCHAR COMMENT 'Metropolitan Statistical Area code',
    TIME_ZONE NUMBER(38,0) COMMENT 'Timezone identifier',
    DST VARCHAR COMMENT 'Daylight savings time flag',
    ZIP_TYPE VARCHAR COMMENT 'Type of ZIP (e.g., PO box, standard)',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record creation timestamp',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Last update timestamp'
);

-- =============================================
-- DIM_STATE with business context comments
-- =============================================

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_STATE (
    STATE_KEY NUMBER(38,0) COMMENT 'Surrogate key generated using hashed FIPS_STATE_CODE',
    FIPS_STATE_CODE VARCHAR(2) COMMENT 'Two-digit FIPS code used as natural key',
    ABBREV VARCHAR(2) COMMENT 'Two-letter state abbreviation (e.g., CA, NY)',
    STATE_NAME VARCHAR COMMENT 'Full state name (e.g., California, New York)',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp when the record was created',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp of the most recent update to the record'
);

-- =============================================
-- DIM_CALENDAR with business context comments
-- =============================================

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_CALENDAR (
    DATE_KEY NUMBER(38,0) PRIMARY KEY COMMENT 'Surrogate key derived from date in YYYYMMDD format',
    CAL_TIME_ID NUMBER(38,0) COMMENT 'Business key used to join calendar in fact tables',
    C_DATE DATE COMMENT 'Actual calendar date',
    DAY_OF_WEEK NUMBER(38,0) COMMENT 'Day of the week (1 = Sunday)',
    DAY_OF_YEAR NUMBER(38,0) COMMENT 'Day number in the year',
    DAY_OF_MONTH NUMBER(38,0) COMMENT 'Day number within the month',
    LAST_DAY_OF_MONTH VARCHAR(1) COMMENT 'Y/N indicator for last day of the month',
    WEEK_OF_YEAR NUMBER(38,0) COMMENT 'ISO week number in the year',
    MONTH NUMBER(38,0) COMMENT 'Month number (1-12)',
    QUARTER NUMBER(38,0) COMMENT 'Calendar quarter (1-4)',
    YEAR NUMBER(38,0) COMMENT 'Four-digit calendar year',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Creation timestamp of the dimension row',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Last modified timestamp of the dimension row'
);


-- =============================================
-- DIM_PACKAGES with business context comments
-- =============================================

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_PACKAGES (
    PACKAGE_SK NUMBER(38,0) COMMENT 'Surrogate key generated by hashing PACKAGE_ID',
    PACKAGE_ID NUMBER(38,0) COMMENT 'Primary key representing a package record (business key)',
    PACKAGE_KEY VARCHAR COMMENT 'Category or type of the package (e.g., inspections, office)',
    INSTANCE_NAME VARCHAR COMMENT 'Descriptive name for the package instance',
    ENABLED_P VARCHAR COMMENT 'Flag indicating whether the package is active (true/false)',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Creation timestamp of this dimension row',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Last updated timestamp of this dimension row'
);

-- =============================================
-- DIM_MANIFESTS with business context comments
-- =============================================

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_MANIFESTS (
    MANIFEST_KEY NUMBER(38,0) COMMENT 'Surrogate key generated by hashing MANIFEST_ID',
    MANIFEST_ID NUMBER(38,0) COMMENT 'Primary key representing a manifest record',
    PRETTY_NAME VARCHAR COMMENT 'User-friendly label describing the manifest (e.g., Full Interior)',
    OBJECT_TYPE VARCHAR COMMENT 'Type/category of object (e.g., INSPECTION)',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp of record creation',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp of last update'
);

-- =============================================
-- DIM_STATUS with business context comments
-- =============================================


CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_STATUS (
    STATUS_KEY NUMBER(38,0) COMMENT 'Surrogate key generated by hashing STATUS_ID',
    STATUS_ID NUMBER(38,0) COMMENT 'Primary key representing the inspection status code',
    STATUS VARCHAR COMMENT 'Human-readable label or description of the status',
    VENDOR_STATUS NUMBER(1,0) COMMENT 'Flag or category for vendor-specific status',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record creation timestamp',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record last updated timestamp'
);

-- =============================================
-- DIM_CONFIGS with business context comments
-- =============================================

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_CONFIGS (
    CONFIG_KEY NUMBER(38,0) COMMENT 'Surrogate key generated from CONFIG_ID',
    CONFIG_ID NUMBER(38,0) COMMENT 'Primary key representing the configuration ID',
    CONFIG_NAME VARCHAR COMMENT 'User-assigned name for the configuration rule',
    CARRIER_ID NUMBER(38,0) COMMENT 'Foreign key to carrier package from DIM_PACKAGES',
    OFFICE_ID NUMBER(38,0) COMMENT 'Foreign key to office location from DIM_PACKAGES',
    USER_ID NUMBER(38,0) COMMENT 'Foreign key to the user associated with the configuration',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record creation timestamp',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record last update timestamp'
);

-- =============================================
-- DIM_TIME_RANGES with business context comments
-- =============================================

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_TIME_RANGES (
    TIME_RANGE_KEY NUMBER(38,0) COMMENT 'Surrogate key generated from RANGE_ID',
    RANGE_ID NUMBER(38,0) COMMENT 'Primary key representing the range ID',
    CONFIG_ID NUMBER(38,0) COMMENT 'Foreign key linking to DIM_CONFIGS.CONFIG_ID',
    LOWER_BOUND NUMBER(38,0) COMMENT 'Minimum threshold value of the configured range',
    UPPER_BOUND NUMBER(38,0) COMMENT 'Maximum threshold value of the configured range',
    RANGE_TYPE VARCHAR(1) COMMENT 'Type of range (e.g., D = Days, P = Percentage)',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Creation timestamp',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Last updated timestamp'
);


-- =============================================
-- DIM_SITE_NODES with business context comments
-- =============================================
/* 
CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_SITE_NODES (
    SITE_KEY NUMBER(38,0) COMMENT 'Surrogate key generated from hashed NODE_ID or OBJECT_ID',
    NODE_ID NUMBER(38,0) COMMENT 'Primary identifier for the site node',
    PARENT_ID NUMBER(38,0) COMMENT 'Parent node ID used for building hierarchies',
    NAME VARCHAR COMMENT 'Name of the folder or node',
    DIRECTORY_P VARCHAR COMMENT 'Boolean flag indicating if this node is a directory',
    PATTERN_P VARCHAR COMMENT 'Pattern flag used for routing or classification',
    OBJECT_ID NUMBER(38,0) COMMENT 'Reference to linked object or external entity',
    SURL VARCHAR COMMENT 'Structured path (e.g., /EMI/Company/Region/Agency)',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record creation timestamp',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Last modification timestamp'
);
*/
CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_SITE_NODES (
    SITE_KEY NUMBER(38,0) COMMENT 'Surrogate key generated from hashed NODE_ID',
    NODE_ID NUMBER(38,0) COMMENT 'Primary identifier for the site node',
    OBJECT_ID NUMBER(38,0) COMMENT 'Object linked to the node, usually package or content ID',
    NAME VARCHAR COMMENT 'Label or name of the node or folder',
    ORG_NAME VARCHAR COMMENT 'Organization name extracted from SURL (e.g., AmericanFamily)',
    ORG_TYPE VARCHAR COMMENT 'Type of organization (e.g., CorporateOffice, Branch)',
    REGION VARCHAR COMMENT 'Geographic region from the hierarchy (e.g., Kansas)',
    AGENCY VARCHAR COMMENT 'Agency or office node extracted from path',
    TEAM_UNIT VARCHAR COMMENT 'Sub-agency or inspection team (e.g., UKS5Inspections)',
    SUBFOLDER_1 VARCHAR COMMENT 'Deeper folder level (e.g., Forms_v2)',
    DIRECTORY_P VARCHAR COMMENT 'Flag for directory node (Y/N)',
    PATTERN_P VARCHAR COMMENT 'Flag for pattern path (Y/N)',
    SURL VARCHAR COMMENT 'Full hierarchical URL path used to derive all location levels',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Row creation timestamp',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Row update timestamp'
);


/* 
CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_SITE_NODES (
    SK_SITE NUMBER(38,0) PRIMARY KEY,       -- Surrogate Key
    NODE_ID NUMBER(38,0),
    OBJECT_ID NUMBER(38,0),
    NAME VARCHAR,                           -- Node name
    ORG_NAME VARCHAR,                       -- Extracted from SURL[2]
    ORG_TYPE VARCHAR,                       -- SURL[3]
    REGION VARCHAR,                         -- SURL[4]
    AGENCY VARCHAR,                         -- SURL[5]
    TEAM_UNIT VARCHAR,                      -- SURL[6]
    SUBFOLDER_1 VARCHAR,                    -- SURL[7] (optional deeper level)
    DIRECTORY_P VARCHAR,
    PATTERN_P VARCHAR,
    SURL VARCHAR,
    SOURCE_DATA_LAND_DATE TIMESTAMP_TZ(9),
    CREATED_DATE TIMESTAMP_NTZ(9),
    UPDATED_DATE TIMESTAMP_NTZ(9)
);
*/

/* 
CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_INSPECTIONS (
    SK_INSPECTION NUMBER(38,0) COMMENT 'Surrogate key generated from hashed INSPECTION_ID',
    INSPECTION_ID NUMBER(38,0) COMMENT 'Primary key representing each unique inspection',
    PROPERTY_ID FLOAT COMMENT 'Property identifier tied to this inspection',
    ORDER_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when the inspection was ordered',
    REVIEW_TYPE VARCHAR COMMENT 'Type of inspection review performed',
    DUE_DATE TIMESTAMP_NTZ(9) COMMENT 'Scheduled due date for the inspection',
    INSPECTION_DATE TIMESTAMP_NTZ(9) COMMENT 'Actual date of inspection',
    EFFECTIVE_DATE TIMESTAMP_NTZ(9) COMMENT 'Date the inspection becomes effective',
    POLICYNUMBER VARCHAR COMMENT 'Insurance policy number',
    PROJECT_NAME VARCHAR COMMENT 'Project name related to the inspection',
    CARRIER VARCHAR COMMENT 'Carrier or organization requesting the inspection',
    INSPECTION_TYPE VARCHAR COMMENT 'Inspection type label (e.g., exterior, full interior)',
    INSPECTION_COMPANY VARCHAR COMMENT 'Company that performed the inspection',
    LOCATED VARCHAR COMMENT 'Location descriptor (manual override or mapping)',
    ZIP VARCHAR COMMENT 'ZIP code for the inspection address',
    CURRENT_STATUS VARCHAR COMMENT 'Current workflow or underwriting status',
    SOURCE_DATA_LAND_DATE TIMESTAMP_TZ(9) COMMENT 'Timestamp when data was received from source system',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp when the inspection record was created',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp when the inspection record was last modified'
);
*/

-- =============================================
-- DIM_INSPECTIONS with business context comments
-- =============================================
CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_INSPECTIONS (
    INSPECTION_KEY NUMBER(38,0) COMMENT 'Surrogate key generated using hashed INSPECTION_ID',
    INSPECTION_ID FLOAT COMMENT 'Primary identifier for the inspection record',
    PROPERTY_ID FLOAT COMMENT 'Business identifier of the property inspected',
    ORDER_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when the inspection was ordered',
    REVIEW_TYPE VARCHAR COMMENT 'Type of review requested (e.g., underwriting)',
    DUE_DATE TIMESTAMP_NTZ(9) COMMENT 'Scheduled due date for the inspection',
    INSPECTION_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when the inspection was actually performed',
    EFFECTIVE_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when inspection becomes effective for policy purposes',
    CLOSE_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when the inspection record was closed',
    VERIFICATION_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when results were verified by QA or underwriter',
    POLICYNUMBER VARCHAR COMMENT 'Insurance policy number associated with this inspection',
    PROJECT_NAME VARCHAR COMMENT 'Project or carrier campaign name (e.g., renewal initiative)',
    CARRIER VARCHAR COMMENT 'Carrier or agency responsible for ordering the inspection',
    INSPECTION_TYPE VARCHAR COMMENT 'Inspection type label (e.g., exterior, full interior)',
    PRETTY_INSP_TYPE VARCHAR COMMENT 'User-friendly label for inspection type',
    INSPECTION_COMPANY VARCHAR COMMENT 'Third-party or internal company who performed inspection',
    ZIP VARCHAR COMMENT 'ZIP/postal code for the inspection site',
    LOCATED VARCHAR COMMENT 'Boolean or flag indicating successful location tagging',
    CURRENT_STATUS VARCHAR COMMENT 'Most recent status of the inspection in workflow',
    NEEDS_ATTENTION VARCHAR COMMENT 'Manual override field indicating special flag or concern',
    ACTION_ITEMS VARCHAR COMMENT 'Items identified during inspection requiring attention',
    HAZARD_COUNT FLOAT COMMENT 'Total number of hazards identified in the inspection',
    HAZARD_VALUE FLOAT COMMENT 'Cumulative hazard value score used by underwriting',
    UNDERWRITER FLOAT COMMENT 'ID of the underwriter assigned to the inspection',
    RUSH VARCHAR COMMENT 'Flag indicating urgency or expedited processing (Y/N)',
    REORDER_INSPECTION VARCHAR COMMENT 'Flag indicating if this is a reordered inspection',
    HISTORICAL_INSPECTION VARCHAR COMMENT 'Flag to distinguish legacy/historical records',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Original creation timestamp of this inspection record',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp of last update to this inspection record'
);


-- =============================================
-- FCT_VENDOR_ON_HAND with business context comments
/*
Joins:
INSPECTIONS via INSPECTION_ID
DIM_MANIFESTS via INSPECTION_TYPE_ID
DIM_STATUS via STATUS_ID
DIM_PACKAGES via VENDOR_ID, CARRIER_ID, etc.
DIM_CALENDAR via TIME_ID, ORDER_DATE_ID, EFFECTIVE_DATE_ID, DUE_DATE_ID, etc.
*/
-- =============================================
--THIS OLD FACT- NOT USE 
CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.FCT_VENDOR_ON_HAND (
    TIME_ID NUMBER(38,0) COMMENT 'Date key representing the snapshot time (FK to DIM_CALENDAR)',
    INSPECTION_ID NUMBER(38,0) COMMENT 'Foreign key to inspection record (DIM_INSPECTIONS)',
    INSPECTION_TYPE_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_MANIFESTS (type of inspection)',
    CARRIER_ID NUMBER(38,0) COMMENT 'FK to DIM_PACKAGES indicating carrier organization',
    CREATION_OFFICE_ID NUMBER(38,0) COMMENT 'FK to DIM_PACKAGES representing the office that created the record',
    VENDOR_ID NUMBER(38,0) COMMENT 'Vendor assigned to inspection (FK to DIM_PACKAGES)',
    OFFICE_ID NUMBER(38,0) COMMENT 'Office responsible for the inspection (FK to DIM_PACKAGES)',
    ORDER_DATE_ID NUMBER(38,0) COMMENT 'Date when the order was placed (FK to DIM_CALENDAR)',
    STATUS_ID NUMBER(38,0) COMMENT 'Inspection status ID (FK to DIM_STATUS)',
    USER_ID NUMBER(38,0) COMMENT 'User responsible for the action (FK to DIM_USER, if applicable)',
    DUE_DATE_ID NUMBER(38,0) COMMENT 'Date when inspection is due (FK to DIM_CALENDAR)',
    DAYS_PAST_ORDER NUMBER(38,0) COMMENT 'Days elapsed since order was placed',
    EFFECTIVE_DATE_ID NUMBER(38,0) COMMENT 'Date inspection becomes effective (FK to DIM_CALENDAR)',
    NEW_BUSINESS NUMBER(38,0) COMMENT 'Flag indicating if inspection is for new business (0/1)',
    DAYS_PAST_EFFECTIVE NUMBER(38,0) COMMENT 'Days since inspection effective date',
    POLICYNUMBER VARCHAR COMMENT 'Policy number associated with the inspection',
    PRODUCER VARCHAR COMMENT 'Producer or agent responsible for the policy',
    PROJECT_NAME VARCHAR COMMENT 'Project or campaign name related to this record',
    ZIP VARCHAR COMMENT '5-digit ZIP code where the inspection is performed',
    APPT_DATE_ID NUMBER(38,0) COMMENT 'Appointment date ID (FK to DIM_CALENDAR)',
    APPT_SET_DATE_ID NUMBER(38,0) COMMENT 'Date when the appointment was scheduled',
    DAYS_PAST_APPOINTMENT NUMBER(38,0) COMMENT 'Number of days since appointment was set',
    MULTIPLE_VENDORS NUMBER(38,0) COMMENT 'Flag indicating whether multiple vendors are assigned (0/1)',
    
    SOURCE_DATA_LAND_DATE TIMESTAMP_TZ(9) COMMENT 'Timestamp when record landed from source system',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record creation timestamp in source system',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Record last update timestamp in source system'
);




-- =============================================
-- FCT_VENDOR_ON_HAND with business context comments
-- =============================================

/*
Grain:
One row per combination of INSPECTION_ID, TIME_ID, and VENDOR_ID.

Purpose:
Tracks vendor-side snapshot of inspections over time — includes scheduling, due dates, assignment office, and whether multiple vendors were involved.

Joins:

INSPECTION_ID → DIM_INSPECTIONS

TIME_ID, ORDER_DATE_ID, DUE_DATE_ID, EFFECTIVE_DATE_ID, APPT_DATE_ID, APPT_SET_DATE_ID → DIM_CALENDAR

INSPECTION_TYPE_ID → DIM_MANIFESTS

STATUS_ID → DIM_STATUS

VENDOR_ID, CARRIER_ID, OFFICE_ID, CREATION_OFFICE_ID → DIM_PACKAGES

*/

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.FCT_VENDOR_ON_HAND (
    TIME_ID NUMBER(38,0) COMMENT 'Snapshot date key from DIM_CALENDAR representing data as-of date',
    INSPECTION_ID FLOAT COMMENT 'Foreign key to DIM_INSPECTIONS representing a specific inspection event',
    INSPECTION_TYPE_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_MANIFESTS representing type of inspection (e.g., Full Interior)',
    CARRIER_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_PACKAGES representing the insurance carrier requesting the inspection',
    CREATION_OFFICE_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_PACKAGES for the office that created the inspection record',
    VENDOR_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_PACKAGES representing the assigned vendor for the inspection',
    OFFICE_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_PACKAGES representing the office responsible for the inspection',
    ORDER_DATE_ID NUMBER(38,0) COMMENT 'Order date key from DIM_CALENDAR indicating when the inspection was placed',
    STATUS_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_STATUS representing current status of the inspection',
    USER_ID NUMBER(38,0) COMMENT 'ID of user responsible for processing (if applicable)',
    DUE_DATE_ID NUMBER(38,0) COMMENT 'Due date key from DIM_CALENDAR for when the inspection is due',
    DAYS_PAST_ORDER NUMBER(38,0) COMMENT 'Number of days past the original order date',
    EFFECTIVE_DATE_ID NUMBER(38,0) COMMENT 'Effective date key from DIM_CALENDAR for when policy impact takes place',
    NEW_BUSINESS NUMBER(38,0) COMMENT 'Flag indicating whether this inspection is for a new business (0/1)',
    DAYS_PAST_EFFECTIVE NUMBER(38,0) COMMENT 'Days past since the policy effective date',
    POLICYNUMBER VARCHAR COMMENT 'Policy number associated with the inspection event',
    PRODUCER VARCHAR COMMENT 'Name of the producer or agency managing the policy',
    PROJECT_NAME VARCHAR COMMENT 'Name of the project or underwriting campaign (e.g., reinspection)',
    ZIP VARCHAR COMMENT 'Postal ZIP code where the inspection was conducted',
    APPT_DATE_ID NUMBER(38,0) COMMENT 'Date key for when the inspection appointment was scheduled',
    APPT_SET_DATE_ID NUMBER(38,0) COMMENT 'Date key for when appointment was formally recorded',
    DAYS_PAST_APPOINTMENT NUMBER(38,0) COMMENT 'Days since the inspection appointment was set',
    MULTIPLE_VENDORS NUMBER(38,0) COMMENT 'Flag indicating if multiple vendors are tied to the inspection (0/1)',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Original creation timestamp of the inspection record',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Last update timestamp for any inspection changes'
);



-- =============================================
-- FCT_CARRIER_ON_HAND with business context comments
-- =============================================

/*
Grain:
One row per INSPECTION_ID, TIME_ID, and CARRIER_ID.

Purpose:
Tracks the carrier-side lifecycle of inspection activity and related performance indicators (e.g., days past due, QA review, effective status, etc.).

Joins:

INSPECTION_ID → DIM_INSPECTIONS

TIME_ID, ORDER_DATE_ID, EFFECTIVE_DATE_ID, APPT_DATE_ID, APPT_SET_DATE_ID, LAST_QA_DATE_ID → DIM_CALENDAR

CARRIER_ID, OFFICE_ID, VENDOR_ID, CREATION_OFFICE_ID → DIM_PACKAGES

STATUS_ID → DIM_STATUS

INSPECTION_TYPE_ID → DIM_MANIFESTS
*/

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.FCT_CARRIER_ON_HAND (
    TIME_ID NUMBER(38,0) COMMENT 'Snapshot date key from DIM_CALENDAR representing data as-of date',
    INSPECTION_ID FLOAT COMMENT 'Foreign key to DIM_INSPECTIONS representing a specific inspection event',
    INSPECTION_TYPE_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_MANIFESTS representing type of inspection (e.g., Full Interior)',
    CARRIER_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_PACKAGES representing the insurance carrier responsible for inspection',
    CREATION_OFFICE_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_PACKAGES representing the creation office',
    VENDOR_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_PACKAGES for the assigned vendor',
    OFFICE_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_PACKAGES representing responsible office',
    ORDER_DATE_ID NUMBER(38,0) COMMENT 'Date when the inspection was ordered (FK to DIM_CALENDAR)',
    DAYS_PAST_ORDER NUMBER(38,0) COMMENT 'Days elapsed since inspection was ordered',
    STATUS_ID NUMBER(38,0) COMMENT 'Foreign key to DIM_STATUS for inspection status',
    USER_ID NUMBER(38,0) COMMENT 'Foreign key to user responsible (can be null)',
    EFFECTIVE_DATE_ID NUMBER(38,0) COMMENT 'Date when policy became effective (FK to DIM_CALENDAR)',
    LAST_QA_DATE_ID NUMBER(38,0) COMMENT 'Date when last QA review occurred (FK to DIM_CALENDAR)',
    NEW_BUSINESS FLOAT COMMENT 'Flag for new business (0/1)',
    ACTIVE FLOAT COMMENT 'Indicates active inspection status (0/1)',
    DAYS_PAST_EFFECTIVE NUMBER(38,0) COMMENT 'Days since the policy effective date',
    POLICYNUMBER VARCHAR COMMENT 'Policy number associated with the inspection',
    PRODUCER VARCHAR COMMENT 'Name of the producer or broker involved',
    PROJECT_NAME VARCHAR COMMENT 'Project or campaign name tied to the inspection',
    ZIP VARCHAR COMMENT 'ZIP/postal code for the location of the inspection',
    APPT_DATE_ID NUMBER(38,0) COMMENT 'Scheduled appointment date (FK to DIM_CALENDAR)',
    APPT_SET_DATE_ID NUMBER(38,0) COMMENT 'Date appointment was formally set',
    DAYS_PAST_APPOINTMENT NUMBER(38,0) COMMENT 'Days passed since appointment date',
    MULTIPLE_VENDORS NUMBER(38,0) COMMENT 'Indicates whether more than one vendor is involved (0/1)',

    SOURCE_DATA_LAND_DATE TIMESTAMP_TZ(9) COMMENT 'Timestamp of data landing from source system',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Creation timestamp in original source',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Last updated timestamp in source'
);





-- =============================================
-- FCT_INSPECTIONS with business context comments
-- =============================================

/*
Grain:
One row per unique INSPECTION_ID

Purpose:
Acts as a flattened summary table of key inspection event metadata. Used for simplified reporting and slicing across status, date milestones, inspection type, and hazard summary.

Joins:

INSPECTION_ID → DIM_INSPECTIONS
(Already denormalized, so it may be queried standalone)
*/

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.FCT_INSPECTIONS (
    INSPECTION_ID FLOAT COMMENT 'Primary key from DIM_INSPECTIONS representing the unique inspection event',
    PROPERTY_ID FLOAT COMMENT 'Business key representing the property tied to this inspection',
    ORDER_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when inspection was ordered',
    DUE_DATE TIMESTAMP_NTZ(9) COMMENT 'Due date of the inspection',
    INSPECTION_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when the inspection was performed',
    EFFECTIVE_DATE TIMESTAMP_NTZ(9) COMMENT 'Effective date of the inspection',
    CLOSE_DATE TIMESTAMP_NTZ(9) COMMENT 'Closure date of the inspection',
    VERIFICATION_DATE TIMESTAMP_NTZ(9) COMMENT 'Date when the inspection results were verified',
    CURRENT_STATUS VARCHAR COMMENT 'Latest status of the inspection in workflow',
    POLICYNUMBER VARCHAR COMMENT 'Policy number tied to the inspection',
    PROJECT_NAME VARCHAR COMMENT 'Project or campaign name (e.g., renewals)',
    CARRIER VARCHAR COMMENT 'Carrier or agency responsible for the inspection',
    INSPECTION_TYPE VARCHAR COMMENT 'Label for the type of inspection conducted',
    PRETTY_INSP_TYPE VARCHAR COMMENT 'User-facing label for inspection type',
    ZIP VARCHAR COMMENT 'ZIP code of the property being inspected',
    HAZARD_COUNT FLOAT COMMENT 'Total hazard count recorded during the inspection',
    HAZARD_VALUE FLOAT COMMENT 'Cumulative hazard score value assigned during inspection',
    UNDERWRITER FLOAT COMMENT 'Underwriter ID assigned to the inspection',

    SOURCE_DATA_LAND_DATE TIMESTAMP_TZ(9) COMMENT 'Timestamp when the data was received from the source',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp when the record was originally created',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Timestamp of the most recent update to the record'
);

-- =============================================
-- BRIDGE_INSPECTION_SITE with business context comments
-- =============================================

/*
Grain:
One row per unique INSPECTION_ID ↔ SITE_NODE_ID relationship

Purpose:
Supports multi-site association per inspection. Enables analysis at location hierarchy (ORG, REGION, AGENCY) or allocation of volume across teams.

Joins:

INSPECTION_ID → DIM_INSPECTIONS

SITE_NODE_ID → DIM_SITE_NODES

Optional RELATION_TYPE for filtering (e.g., scheduled_at, handled_by)
*/

CREATE OR REPLACE TABLE UWC_INSPECTION_ANALYTICS_V2.BRIDGE_INSPECTION_SITE (
    INSPECTION_ID FLOAT COMMENT 'Foreign key referencing DIM_INSPECTIONS.INSPECTION_ID',
    SITE_NODE_ID NUMBER(38,0) COMMENT 'Foreign key referencing DIM_SITE_NODES.NODE_ID',
    RELATION_TYPE VARCHAR COMMENT 'Describes the type of link (e.g., scheduled_at, owned_by, originated_from)',
    SOURCE_DATA_LAND_DATE TIMESTAMP_TZ(9) COMMENT 'Timestamp indicating when the mapping landed from source system',
    CREATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Creation timestamp of the bridge record',
    UPDATED_DATE TIMESTAMP_NTZ(9) COMMENT 'Update timestamp of the bridge record'
);






-- =============================================
-- DIM_STATE LOAD PROCEDURE TEMPLATE (TRUNCATE + INSERT)
-- =============================================
CREATE OR REPLACE PROCEDURE UWC_INSPECTION_ANALYTICS_V2.SP_LOAD_DIM_STATE()
RETURNS STRING
LANGUAGE SQL
AS
$$
DECLARE
BEGIN
  -- Step 1: Truncate the target dimension table
  TRUNCATE TABLE UWC_INSPECTION_ANALYTICS_V2.DIM_STATE;

  -- Step 2: Load fresh data
  INSERT INTO UWC_INSPECTION_ANALYTICS_V2.DIM_STATE (
    SK_STATE,
    FIPS_STATE_CODE,
    ABBREV,
    STATE_NAME,
    SOURCE_DATA_LAND_DATE,
    CREATED_DATE,
    UPDATED_DATE
  )
  SELECT
    ABS(HASH(TO_VARCHAR(FIPS_STATE_CODE), 'MD5')) % 1e9 AS SK_STATE,
    FIPS_STATE_CODE,
    ABBREV,
    STATE_NAME,
    SOURCE_DATA_LAND_DATE,
    CURRENT_TIMESTAMP AS CREATED_DATE,
    CURRENT_TIMESTAMP AS UPDATED_DATE
  FROM EDR_PROPERTY_UWC_SBX.UW_INSPECTION_CONFIG.US_STATES;

  RETURN 'DIM_STATE loaded successfully';
END;
$$;