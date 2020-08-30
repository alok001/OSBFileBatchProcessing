xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/FileService";
(:: import schema at "Resources/FileArtifacts/file_input.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/top/AddMultiCustomer";
(:: import schema at "Resources/DBArtifacts/AddMultiCustomer_table.xsd" ::)

declare variable $fileReq as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($fileReq as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:CustomCustomerCollection) ::) {
    <ns2:CustomCustomerCollection>
        {
            for $customer in $fileReq/ns1:customer
            return 
            <ns2:CustomCustomer>
                <ns2:customerId>{fn:data($customer/ns1:C1)}</ns2:customerId>
                <ns2:customerName>{fn:data($customer/ns1:C2)}</ns2:customerName>
                <ns2:city>{fn:data($customer/ns1:C4)}</ns2:city>
                <ns2:professionType>{fn:data($customer/ns1:C3)}</ns2:professionType></ns2:CustomCustomer>
        }
    </ns2:CustomCustomerCollection>
};

local:func($fileReq)