Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3366F89F3
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 May 2023 22:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683316905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NQk6Ekh4LX4PyDE92pvwmHxMXAFSpqPIsxlJIpXSogI=;
	b=UnMc7XXn7esktsvn+fApr6fkZgRNOdP/4ZaI8ASNQWI7BX9dUeFIvNFAvQDTkoZDem1uQr
	4TeBUXHgtqxsuQEqEzcQVeGHsjzv1NuLyR7fUVWBMO6Wxm58SRQ/oMI5dCHKBhTd93aFwa
	0XxmUxsZJxhpiKzUCrYx/jcaOXxVlj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-StUozCWPMkCZt5P9XfoiTA-1; Fri, 05 May 2023 16:01:42 -0400
X-MC-Unique: StUozCWPMkCZt5P9XfoiTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EED8B101A531;
	Fri,  5 May 2023 20:01:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54AA014152F6;
	Fri,  5 May 2023 20:01:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 985C01946A4A;
	Fri,  5 May 2023 20:01:33 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 06B9B1946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  5 May 2023 20:01:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C01062166B32; Fri,  5 May 2023 20:01:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B57252166B31
 for <linux-cachefs@redhat.com>; Fri,  5 May 2023 20:01:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AC2985A5A3
 for <linux-cachefs@redhat.com>; Fri,  5 May 2023 20:01:27 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-MqhRNfScPGCAM4og5y8IrA-1; Fri, 05 May 2023 16:01:20 -0400
X-MC-Unique: MqhRNfScPGCAM4og5y8IrA-1
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345EY7uw026685; Fri, 5 May 2023 17:22:34 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qburgdhwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 May 2023 17:22:34 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 345GfcAh024930; Fri, 5 May 2023 17:22:33 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3q8spabw39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 May 2023 17:22:33 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by BN0PR10MB5127.namprd10.prod.outlook.com (2603:10b6:408:124::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 17:22:30 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%5]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 17:22:30 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Thread-Topic: [PATCH -next 1/2] Change notify_change() to take struct path
 argument
Thread-Index: AQHZf3YrmvK3dThuLEiKy+nYmX5Fhw==
Date: Fri, 5 May 2023 17:22:29 +0000
Message-ID: <4B2B4BA9-BD13-4AEB-B1C4-DFC400074990@oracle.com>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230505081200.254449-2-xiujianfeng@huawei.com>
In-Reply-To: <20230505081200.254449-2-xiujianfeng@huawei.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|BN0PR10MB5127:EE_
x-ms-office365-filtering-correlation-id: 61f653fc-accd-4331-6bfe-08db4d8d4e2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 7QVg0L9Bqxfb8e6Gx01FQWvsneIXGQh2GPU4c0bDRLGbOKMjDxalWCBc5MsnvO3czpH3Ck2mrmS38hjGMWMgXbi2BrqUTOXRB/BAsQVAzFrcY9b2aGjF3QAo918/BSjQDKcsDr4R6hNw/sseAFLEIAGZM6aTBZAh5rcSREeZ/5C5BoZVEOVWf23ya9BcbY1nmEtTv4/+qIL7Omf6WNfXgkARHvu1p5T8MgDlJCmDLnnTeEJBJguT1LtbOmxRFBJSE2CoavrTQEZlZqlVCiNzA3jGPYYBh1YNkLtMpbJFNDdNZWQUXbfxXiomYj2c/7E/slTFRqRkIovKI6FAgRsoqUlPm3MHJwqU+sK96VqYbDh8/UDi11hGlDpAMmqUl8zx1jq7AMPB84xSMyNjUh7NDjJWyOxKovGiQoToLflErvpv26GtYOB2a7rRB5o69NdPepx5e2XYzWo+eP5eI7M3m4vKOJLUtHyHgm+uW9KH1W5Ff/UESpe5SBf6b0uLxl947S1wew2rg+Ton0SaeOVlO+gbvkmNLqwknWmY7OVOpXAOV2ct1pcg5Kr51+RWF6ktVYzMDFG1k0j/DJ0kRKe1FNdpP0jlDEW7bAf4y8HrIsJdqpz9niAkuqvu1l0eTo9LGNsD7bpz7c9mlfoEl+1Fsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(36756003)(33656002)(86362001)(54906003)(91956017)(316002)(76116006)(66946007)(66556008)(66476007)(64756008)(66446008)(4326008)(6486002)(6916009)(71200400001)(478600001)(7416002)(41300700001)(8676002)(5660300002)(8936002)(30864003)(2906002)(7406005)(38070700005)(122000001)(38100700002)(186003)(2616005)(53546011)(6512007)(6506007)(26005)(83380400001)(45980500001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KK4JA1XO8OWiwky9F5BEKwCnbE3nMuaGdwpkbFQBOPjxZmPQ1KSukkvXRA8M?=
 =?us-ascii?Q?SPBgYYv5/sUpIbTOphTqWt2CNEM1G/nKJJQ1dRQA0aerpdHs9f/tissOWAdM?=
 =?us-ascii?Q?SNn+zJOWIXKwqEelyata9//iFNrauuo+4oTOEXezrl8cxy9nHMzbLH5vR9nC?=
 =?us-ascii?Q?ZGGefU042tozOsXk8knxhamQNzGTEp8CVJuNdkq3ndvgTri81+KjqUEUlI52?=
 =?us-ascii?Q?XPp5sr+gOGrKFbiPCauAWOEnejcepQoRCeDA5Las0TuoLnI00wHIVz56Mrrq?=
 =?us-ascii?Q?Sq5u8BQTW2FGjj1YEZhQ8G5QSwjgS2hQjaITFkb9YXg8qIkUb/BhddVLepGH?=
 =?us-ascii?Q?BL6BmFcP3Ighbc93FHjVRwcCWJu5VPeyTQkegHdg+1vKbNr+QECGxHyrWvaC?=
 =?us-ascii?Q?da6w9ofJlzxOWUqK6QFDg0IlirDMzUjCioZfFzbf4CJTYaEEein/NeeZ56St?=
 =?us-ascii?Q?88ommhP5iPlE/VmCsbhNz4tC+hAAtDH/xmk3L2CwAg1mFADrpTb2vmLwq8xJ?=
 =?us-ascii?Q?/4Sz06xNgjSP3sq5Wj7gOeScTb1AIZFp7m4bgwPOxpPcjFqRxGZGf+FpG/qI?=
 =?us-ascii?Q?b/TV0UTEJtwZZ66f5S3tzUKJycCev6rtoM2DLFe6pIQLJUZRyCv5bcCBji+0?=
 =?us-ascii?Q?9+MtCYIMzsJQIDn1IC1SUk9WR7TBFmy6YN15nDjh37VGjTZNbdpHk3OLf2n5?=
 =?us-ascii?Q?OFlpEEs9aZaalirsnoa61MM+tR7T0THtifc0Di1xie7w7gTSS74WM0qxfRMj?=
 =?us-ascii?Q?goKGFLd6a5SOK/zR8jTwX8Xcb1RtMIoY93C1fVAIQfoaBif/YtRyUR4O+xSY?=
 =?us-ascii?Q?n5pspwpf9IQFjG0BVtzHrw0SDPgRVTqakPFu2AfTOtvIZGCvi4xYaHpctkSL?=
 =?us-ascii?Q?Jf0WvqL6sFKFapKRDiHjH3yiBC9pi5wOz3T4Fz1p1zwHbr4b8BMf7Uqgwqo4?=
 =?us-ascii?Q?cBKd1WdpZ0/s3BKx8PgVCFpEQ5266VVYCgtaEb0LenSNr5wO737sW7QmboNk?=
 =?us-ascii?Q?ovFslaKrdKWlUP/nqlDAv9nDwemSYUMGH6HJdnzQ0O/DPr/EBMs6tJLwJzPH?=
 =?us-ascii?Q?pxlVcUnz1ubYpZ8e39Xef97CcDmxOzfEs/yQeVxmX+4LUetSsf3TYpRIGV5F?=
 =?us-ascii?Q?Nk2mcTJBw6rvgr2N/5DJkI9gpAaI1L+aqOtBov99+PlZuSFMOLuNI1S/yKq1?=
 =?us-ascii?Q?fEXQF39jrq9uXxV8RKXn7+Dqk6nw30ov4Tj55O5PampAGR4fEGNuT8OeJits?=
 =?us-ascii?Q?qyHBqKaBg9q+Cpei6h+9aHs42HLgHMUkKVGONso0cEwDQ/N7wGqy/K2EZq1R?=
 =?us-ascii?Q?F7dp2K4+/x1rawEcIyGsNd2aviz9KUfrp9ObcPzT4ymDM05bzGcFtFhZedEK?=
 =?us-ascii?Q?olYFQFKHEssa4Uc5LlGW+YGJ4NkYSdJeoypQFuH8S1zOeeJ3zWvE8hRUt4Nr?=
 =?us-ascii?Q?NsltXLmdKDTvUldU4T5id+Kf8mCx3yzs6mzISSMTXGaIcnHwYtjXxmgEVrli?=
 =?us-ascii?Q?8kzFeAnFACuCtyj9JZ4AoU+V1PUQ+MLdnVN42zI9d1+9n/1/MZPIPWFN/j/w?=
 =?us-ascii?Q?v8fuaSo8+aGkM+HMp7H7gDyxgDBs8m9cERbyfuVLTZzMZF4yj4sN1X9sXf0r?=
 =?us-ascii?Q?Yw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?JgBIIPeiXuIebzDFCW9llVlOwxWFZrIRNVe6KznZq04NIf7WCThcBGGpc2U7?=
 =?us-ascii?Q?2m5RBmkNsdrZcT6a9JnyAEIT3G24QK11Txux0bv2L8Ovx0nFVGWYfDT93sfj?=
 =?us-ascii?Q?z1b0H32SHWoGrzJNr771IMjqWyFQve3jb2YCeMddpte622wPC8f9MwZYKH3x?=
 =?us-ascii?Q?x0GEypsJRR1QiUggmGf70qYWp21laLL5BoUaN8BCxlGd4AvmVrTjWLQOLmKZ?=
 =?us-ascii?Q?rXCIqAAEDq4UbXrq9sXGc6Lsdd1Dxis36j+EXy5sc9a0C9q4lx5zM37Xg7PD?=
 =?us-ascii?Q?Ftmk043QGcxK/2PAuSxBSqwAEaUFURotEiHHWdmEoeiz3dsC1rJALryWq6J2?=
 =?us-ascii?Q?gkcIynoGn7h61YDkK6l54zKqkkvW6y4secz8anOgeoKzCaXsUgizM1jLGkuK?=
 =?us-ascii?Q?sY8nY9wXsYNbl3qzz5FBHOkXCAlhrW3KNlHrfe2Q7yTdZ0QYvFSGholHQnvc?=
 =?us-ascii?Q?ROe78ayneK1RkFTAIbBPfD6nIaILG5luOstPmk+rfwKtTZIUChoyffqZlyQS?=
 =?us-ascii?Q?M66rh91otBy/5fgXGZQm7+xZS2a6lQtK35PkzwQZTIvKHOb/XoKV/e0yfrtO?=
 =?us-ascii?Q?jGdgB1W3Xq7u9QYejuUZM2cAy9dS4lRtPwNZpNr1dMIUqo81mT+rYuwJ8DF3?=
 =?us-ascii?Q?fk256zy5X3WFJymGy5RU088/aax+hcbL0/pC0WMG3DTY4W/Ky0ykhyxU0uvO?=
 =?us-ascii?Q?1AmeWmKmpMNl7Yn/c+lha4PFQso1CA0phFTOV/ecjJz4Y8BkUrlwhpBkjp6h?=
 =?us-ascii?Q?b6TQUDAjrg5cVHwGgSra7jwzRCmXPg2EVuNBXQx1k9zEZB6yEGcPETpeAlhe?=
 =?us-ascii?Q?FumWnGTCS4/+7eX/GrHBnP56VnsSJODoosLk2Ah35yVnqC94l5SggYxPz3pK?=
 =?us-ascii?Q?mYYqW/oVuAOjgHZh6VhbRG7QsYI3uMows1/39+zb5I0ipgHs+v87H5pTBy3A?=
 =?us-ascii?Q?J0scAoOOD2FIa3q0beOBwcAlUFls6sjN/fmAgqbx5j1X8fp08/vffi7ibenV?=
 =?us-ascii?Q?XaR0mJ6jVXwO3E5BW/pViwqTR0gQqbqXytMfc6AQHn1D7571JJnpcA3OlFho?=
 =?us-ascii?Q?/gb4LodFX+NXdGsRAKFLI+dUrJYlZcjTppdKbERX7O6mu40PFb0f8Eyz6GWD?=
 =?us-ascii?Q?kMqDxyTz/zLQPStECQ2m1BHn8G4ncbWpFAKNwEW0yzUUcX3ayqG5vRej05Ux?=
 =?us-ascii?Q?n0/E/LRWLOhKaT5Vr0gD0JBUiBko3sLrWv9Rc0/MJ4T1KvH+xACk/4AF7rOV?=
 =?us-ascii?Q?doo0aoIeCABRNcSq+f6bEJofLCmHWMhBwwlibgQuQ72C9/NwBYE/lTBVYivW?=
 =?us-ascii?Q?LvhFhNGcnhK3p+KMg0inA6XKv8z4Mj3xZXiDZLjOFXWoBX0yOmkdGOP4P+SN?=
 =?us-ascii?Q?9xDO6IaNMayCjUO3ojx4nVkNp3/ojCtNVxcQHtX+BL+sFTlG3nl14e+X8/zs?=
 =?us-ascii?Q?VOXixnpUhPxGXwmnuvNqr8ykWfhAbIVd7nl2JqcNpDMzz6sNjkq5atzBOssB?=
 =?us-ascii?Q?3Ul3sXRzROJehiKKzPZGH9Ap1Aa1vWZ/fPmz7ro4ait9OUnnTawE93kF7Gn7?=
 =?us-ascii?Q?WadmZyp040nObC27c3w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f653fc-accd-4331-6bfe-08db4d8d4e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 17:22:29.9731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNpGhwZvmgSzrMyUu8vOIX111ewEiCpoCRgAVvauxnLTzh6uNffUrky94r7HNvvy2z/u28j7HP8RBLS09xXTIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5127
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050143
X-Proofpoint-GUID: wPDLz_fH6a0iiSK8jwrTNMykOf3B8sur
X-Proofpoint-ORIG-GUID: wPDLz_fH6a0iiSK8jwrTNMykOf3B8sur
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH -next 1/2] Change notify_change() to
 take struct path argument
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: "mortonm@chromium.org" <mortonm@chromium.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "roberto.sassu@huawei.com" <roberto.sassu@huawei.com>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, "paul@paul-moore.com" <paul@paul-moore.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Michael Ellerman <mpe@ellerman.id.au>,
 "jmorris@namei.org" <jmorris@namei.org>, "code@tyhicks.com" <code@tyhicks.com>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 "fred@cloudflare.com" <fred@cloudflare.com>,
 "serge@hallyn.com" <serge@hallyn.com>,
 "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tom Talpey <tom@talpey.com>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "wangweiyang2@huawei.com" <wangweiyang2@huawei.com>,
 Al Viro <viro@zeniv.linux.org.uk>, "dchinner@redhat.com" <dchinner@redhat.com>,
 "mic@digikod.net" <mic@digikod.net>,
 "eparis@parisplace.org" <eparis@parisplace.org>,
 "hirofumi@mail.parknet.co.jp" <hirofumi@mail.parknet.co.jp>,
 "gnoack3000@gmail.com" <gnoack3000@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 "john.johansen@canonical.com" <john.johansen@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "casey@schaufler-ca.com" <casey@schaufler-ca.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: oracle.com
Content-Language: en-US
Content-ID: <31B92849520C5844BB1F4D6BB2671EB2@namprd10.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On May 5, 2023, at 4:11 AM, Xiu Jianfeng <xiujianfeng@huawei.com> wrote:
> 
> For path-based LSMs such as Landlock, struct path instead of struct
> dentry is required to make sense of attr/xattr accesses. notify_change()
> is the main caller of security_inode_setattr(), so refactor it first
> before lsm hook inode_setattr().
> 
> This patch also touches do_truncate() and other related callers.
> 
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
> ---
> drivers/base/devtmpfs.c   |  5 +++--
> fs/attr.c                 |  5 +++--
> fs/cachefiles/interface.c |  4 ++--
> fs/coredump.c             |  2 +-
> fs/ecryptfs/inode.c       | 18 +++++++++---------
> fs/inode.c                |  8 +++++---
> fs/ksmbd/smb2pdu.c        |  6 +++---
> fs/ksmbd/smbacl.c         |  2 +-
> fs/namei.c                |  2 +-
> fs/nfsd/vfs.c             | 12 ++++++++----
> fs/open.c                 | 19 ++++++++++---------
> fs/overlayfs/overlayfs.h  |  4 +++-
> fs/utimes.c               |  2 +-
> include/linux/fs.h        |  4 ++--
> 14 files changed, 52 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
> index b848764ef018..e67dd258984c 100644
> --- a/drivers/base/devtmpfs.c
> +++ b/drivers/base/devtmpfs.c
> @@ -220,13 +220,14 @@ static int handle_create(const char *nodename, umode_t mode, kuid_t uid,
> dev->devt);
> if (!err) {
> struct iattr newattrs;
> + struct path new = { .mnt = path.mnt, .dentry = dentry };
> 
> newattrs.ia_mode = mode;
> newattrs.ia_uid = uid;
> newattrs.ia_gid = gid;
> newattrs.ia_valid = ATTR_MODE|ATTR_UID|ATTR_GID;
> inode_lock(d_inode(dentry));
> - notify_change(&nop_mnt_idmap, dentry, &newattrs, NULL);
> + notify_change(&nop_mnt_idmap, &new, &newattrs, NULL);
> inode_unlock(d_inode(dentry));
> 
> /* mark as kernel-created inode */
> @@ -334,7 +335,7 @@ static int handle_remove(const char *nodename, struct device *dev)
> newattrs.ia_valid =
> ATTR_UID|ATTR_GID|ATTR_MODE;
> inode_lock(d_inode(dentry));
> - notify_change(&nop_mnt_idmap, dentry, &newattrs, NULL);
> + notify_change(&nop_mnt_idmap, &p, &newattrs, NULL);
> inode_unlock(d_inode(dentry));
> err = vfs_unlink(&nop_mnt_idmap, d_inode(parent.dentry),
> dentry, NULL);
> diff --git a/fs/attr.c b/fs/attr.c
> index d60dc1edb526..eecd78944b83 100644
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -354,7 +354,7 @@ EXPORT_SYMBOL(may_setattr);
> /**
>  * notify_change - modify attributes of a filesytem object
>  * @idmap: idmap of the mount the inode was found from
> - * @dentry: object affected
> + * @path: path of object affected
>  * @attr: new attributes
>  * @delegated_inode: returns inode, if the inode is delegated
>  *
> @@ -378,9 +378,10 @@ EXPORT_SYMBOL(may_setattr);
>  * permissions. On non-idmapped mounts or if permission checking is to be
>  * performed on the raw inode simply pass @nop_mnt_idmap.
>  */
> -int notify_change(struct mnt_idmap *idmap, struct dentry *dentry,
> +int notify_change(struct mnt_idmap *idmap, const struct path *path,
>  struct iattr *attr, struct inode **delegated_inode)
> {
> + struct dentry *dentry = path->dentry;
> struct inode *inode = dentry->d_inode;
> umode_t mode = inode->i_mode;
> int error;
> diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
> index 40052bdb3365..4700285a76f0 100644
> --- a/fs/cachefiles/interface.c
> +++ b/fs/cachefiles/interface.c
> @@ -138,7 +138,7 @@ static int cachefiles_adjust_size(struct cachefiles_object *object)
> newattrs.ia_size = oi_size & PAGE_MASK;
> ret = cachefiles_inject_remove_error();
> if (ret == 0)
> - ret = notify_change(&nop_mnt_idmap, file->f_path.dentry,
> + ret = notify_change(&nop_mnt_idmap, &file->f_path,
>    &newattrs, NULL);
> if (ret < 0)
> goto truncate_failed;
> @@ -148,7 +148,7 @@ static int cachefiles_adjust_size(struct cachefiles_object *object)
> newattrs.ia_size = ni_size;
> ret = cachefiles_inject_write_error();
> if (ret == 0)
> - ret = notify_change(&nop_mnt_idmap, file->f_path.dentry,
> + ret = notify_change(&nop_mnt_idmap, &file->f_path,
>    &newattrs, NULL);
> 
> truncate_failed:
> diff --git a/fs/coredump.c b/fs/coredump.c
> index ece7badf701b..01bef4830bfa 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -736,7 +736,7 @@ void do_coredump(const kernel_siginfo_t *siginfo)
> }
> if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
> goto close_fail;
> - if (do_truncate(idmap, cprm.file->f_path.dentry,
> + if (do_truncate(idmap, &cprm.file->f_path,
> 0, 0, cprm.file))
> goto close_fail;
> }
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 83274915ba6d..423bd457623e 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -853,12 +853,12 @@ int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
> 
> rc = truncate_upper(dentry, &ia, &lower_ia);
> if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
> - struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
> + const struct path *lower_path = ecryptfs_dentry_to_lower_path(dentry);
> 
> - inode_lock(d_inode(lower_dentry));
> - rc = notify_change(&nop_mnt_idmap, lower_dentry,
> + inode_lock(d_inode(lower_path->dentry));
> + rc = notify_change(&nop_mnt_idmap, lower_path,
>   &lower_ia, NULL);
> - inode_unlock(d_inode(lower_dentry));
> + inode_unlock(d_inode(lower_path->dentry));
> }
> return rc;
> }
> @@ -888,7 +888,7 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
>    struct dentry *dentry, struct iattr *ia)
> {
> int rc = 0;
> - struct dentry *lower_dentry;
> + const struct path *lower_path;
> struct iattr lower_ia;
> struct inode *inode;
> struct inode *lower_inode;
> @@ -902,7 +902,7 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
> }
> inode = d_inode(dentry);
> lower_inode = ecryptfs_inode_to_lower(inode);
> - lower_dentry = ecryptfs_dentry_to_lower(dentry);
> + lower_path = ecryptfs_dentry_to_lower_path(dentry);
> mutex_lock(&crypt_stat->cs_mutex);
> if (d_is_dir(dentry))
> crypt_stat->flags &= ~(ECRYPTFS_ENCRYPTED);
> @@ -964,9 +964,9 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
> if (lower_ia.ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID))
> lower_ia.ia_valid &= ~ATTR_MODE;
> 
> - inode_lock(d_inode(lower_dentry));
> - rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia, NULL);
> - inode_unlock(d_inode(lower_dentry));
> + inode_lock(d_inode(lower_path->dentry));
> + rc = notify_change(&nop_mnt_idmap, lower_path, &lower_ia, NULL);
> + inode_unlock(d_inode(lower_path->dentry));
> out:
> fsstack_copy_attr_all(inode, lower_inode);
> return rc;
> diff --git a/fs/inode.c b/fs/inode.c
> index 577799b7855f..4fa51d46f655 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -1973,7 +1973,7 @@ int dentry_needs_remove_privs(struct mnt_idmap *idmap,
> }
> 
> static int __remove_privs(struct mnt_idmap *idmap,
> -  struct dentry *dentry, int kill)
> +  struct path *path, int kill)
> {
> struct iattr newattrs;
> 
> @@ -1982,13 +1982,15 @@ static int __remove_privs(struct mnt_idmap *idmap,
> * Note we call this on write, so notify_change will not
> * encounter any conflicting delegations:
> */
> - return notify_change(idmap, dentry, &newattrs, NULL);
> + return notify_change(idmap, path, &newattrs, NULL);
> }
> 
> static int __file_remove_privs(struct file *file, unsigned int flags)
> {
> struct dentry *dentry = file_dentry(file);
> struct inode *inode = file_inode(file);
> + /* this path maybe incorrect */
> + struct path path = {.mnt = file->f_path.mnt, .dentry = dentry};
> int error = 0;
> int kill;
> 
> @@ -2003,7 +2005,7 @@ static int __file_remove_privs(struct file *file, unsigned int flags)
> if (flags & IOCB_NOWAIT)
> return -EAGAIN;
> 
> - error = __remove_privs(file_mnt_idmap(file), dentry, kill);
> + error = __remove_privs(file_mnt_idmap(file), &path, kill);
> }
> 
> if (!error)
> diff --git a/fs/ksmbd/smb2pdu.c b/fs/ksmbd/smb2pdu.c
> index cb93fd231f4e..2b7e5c446397 100644
> --- a/fs/ksmbd/smb2pdu.c
> +++ b/fs/ksmbd/smb2pdu.c
> @@ -5644,8 +5644,8 @@ static int set_file_basic_info(struct ksmbd_file *fp,
> }
> 
> if (attrs.ia_valid) {
> - struct dentry *dentry = filp->f_path.dentry;
> - struct inode *inode = d_inode(dentry);
> + struct path *path = &filp->f_path;
> + struct inode *inode = d_inode(path->dentry);
> 
> if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
> return -EACCES;
> @@ -5653,7 +5653,7 @@ static int set_file_basic_info(struct ksmbd_file *fp,
> inode_lock(inode);
> inode->i_ctime = attrs.ia_ctime;
> attrs.ia_valid &= ~ATTR_CTIME;
> - rc = notify_change(idmap, dentry, &attrs, NULL);
> + rc = notify_change(idmap, path, &attrs, NULL);
> inode_unlock(inode);
> }
> return rc;
> diff --git a/fs/ksmbd/smbacl.c b/fs/ksmbd/smbacl.c
> index 6d6cfb6957a9..39d8aff3ae1b 100644
> --- a/fs/ksmbd/smbacl.c
> +++ b/fs/ksmbd/smbacl.c
> @@ -1403,7 +1403,7 @@ int set_info_sec(struct ksmbd_conn *conn, struct ksmbd_tree_connect *tcon,
> }
> 
> inode_lock(inode);
> - rc = notify_change(idmap, path->dentry, &newattrs, NULL);
> + rc = notify_change(idmap, path, &newattrs, NULL);
> inode_unlock(inode);
> if (rc)
> goto out;
> diff --git a/fs/namei.c b/fs/namei.c
> index e4fe0879ae55..ec7075a8505d 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -3292,7 +3292,7 @@ static int handle_truncate(struct mnt_idmap *idmap, struct file *filp)
> 
> error = security_file_truncate(filp);
> if (!error) {
> - error = do_truncate(idmap, path->dentry, 0,
> + error = do_truncate(idmap, path, 0,
>    ATTR_MTIME|ATTR_CTIME|ATTR_OPEN,
>    filp);
> }
> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index bb9d47172162..4b51fd2f05e3 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -410,7 +410,7 @@ nfsd_get_write_access(struct svc_rqst *rqstp, struct svc_fh *fhp,
> return nfserrno(get_write_access(inode));
> }
> 
> -static int __nfsd_setattr(struct dentry *dentry, struct iattr *iap)
> +static int __nfsd_setattr(struct path *path, struct iattr *iap)
> {
> int host_err;
> 
> @@ -430,7 +430,7 @@ static int __nfsd_setattr(struct dentry *dentry, struct iattr *iap)
> if (iap->ia_size < 0)
> return -EFBIG;
> 
> - host_err = notify_change(&nop_mnt_idmap, dentry, &size_attr, NULL);
> + host_err = notify_change(&nop_mnt_idmap, path, &size_attr, NULL);
> if (host_err)
> return host_err;
> iap->ia_valid &= ~ATTR_SIZE;
> @@ -448,7 +448,7 @@ static int __nfsd_setattr(struct dentry *dentry, struct iattr *iap)
> return 0;
> 
> iap->ia_valid |= ATTR_CTIME;
> - return notify_change(&nop_mnt_idmap, dentry, iap, NULL);
> + return notify_change(&nop_mnt_idmap, path, iap, NULL);
> }
> 
> /**
> @@ -471,6 +471,7 @@ nfsd_setattr(struct svc_rqst *rqstp, struct svc_fh *fhp,
>     struct nfsd_attrs *attr,
>     int check_guard, time64_t guardtime)
> {
> + struct path path;
> struct dentry *dentry;
> struct inode *inode;
> struct iattr *iap = attr->na_iattr;
> @@ -534,9 +535,12 @@ nfsd_setattr(struct svc_rqst *rqstp, struct svc_fh *fhp,
> return err;
> }
> 
> + path.mnt = fhp->fh_export->ex_path.mnt;
> + path.dentry = fhp->fh_dentry;
> +
> inode_lock(inode);
> for (retries = 1;;) {
> - host_err = __nfsd_setattr(dentry, iap);
> + host_err = __nfsd_setattr(&path, iap);
> if (host_err != -EAGAIN || !retries--)
> break;
> if (!nfsd_wait_for_delegreturn(rqstp, inode))

Acked-by: Chuck Lever <chuck.lever@oracle.com <mailto:chuck.lever@oracle.com>>


> diff --git a/fs/open.c b/fs/open.c
> index 4478adcc4f3a..7a7841606285 100644
> --- a/fs/open.c
> +++ b/fs/open.c
> @@ -37,11 +37,12 @@
> 
> #include "internal.h"
> 
> -int do_truncate(struct mnt_idmap *idmap, struct dentry *dentry,
> +int do_truncate(struct mnt_idmap *idmap, const struct path *path,
> loff_t length, unsigned int time_attrs, struct file *filp)
> {
> int ret;
> struct iattr newattrs;
> + struct dentry *dentry = path->dentry;
> 
> /* Not pretty: "inode->i_size" shouldn't really be signed. But it is. */
> if (length < 0)
> @@ -63,7 +64,7 @@ int do_truncate(struct mnt_idmap *idmap, struct dentry *dentry,
> 
> inode_lock(dentry->d_inode);
> /* Note any delegations or leases have already been broken: */
> - ret = notify_change(idmap, dentry, &newattrs, NULL);
> + ret = notify_change(idmap, path, &newattrs, NULL);
> inode_unlock(dentry->d_inode);
> return ret;
> }
> @@ -109,7 +110,7 @@ long vfs_truncate(const struct path *path, loff_t length)
> 
> error = security_path_truncate(path);
> if (!error)
> - error = do_truncate(idmap, path->dentry, length, 0, NULL);
> + error = do_truncate(idmap, path, length, 0, NULL);
> 
> put_write_and_out:
> put_write_access(inode);
> @@ -157,7 +158,7 @@ COMPAT_SYSCALL_DEFINE2(truncate, const char __user *, path, compat_off_t, length
> long do_sys_ftruncate(unsigned int fd, loff_t length, int small)
> {
> struct inode *inode;
> - struct dentry *dentry;
> + struct path *path;
> struct fd f;
> int error;
> 
> @@ -173,8 +174,8 @@ long do_sys_ftruncate(unsigned int fd, loff_t length, int small)
> if (f.file->f_flags & O_LARGEFILE)
> small = 0;
> 
> - dentry = f.file->f_path.dentry;
> - inode = dentry->d_inode;
> + path = &f.file->f_path;
> + inode = d_inode(path->dentry);
> error = -EINVAL;
> if (!S_ISREG(inode->i_mode) || !(f.file->f_mode & FMODE_WRITE))
> goto out_putf;
> @@ -191,7 +192,7 @@ long do_sys_ftruncate(unsigned int fd, loff_t length, int small)
> sb_start_write(inode->i_sb);
> error = security_file_truncate(f.file);
> if (!error)
> - error = do_truncate(file_mnt_idmap(f.file), dentry, length,
> + error = do_truncate(file_mnt_idmap(f.file), path, length,
>    ATTR_MTIME | ATTR_CTIME, f.file);
> sb_end_write(inode->i_sb);
> out_putf:
> @@ -640,7 +641,7 @@ int chmod_common(const struct path *path, umode_t mode)
> goto out_unlock;
> newattrs.ia_mode = (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO);
> newattrs.ia_valid = ATTR_MODE | ATTR_CTIME;
> - error = notify_change(mnt_idmap(path->mnt), path->dentry,
> + error = notify_change(mnt_idmap(path->mnt), path,
>      &newattrs, &delegated_inode);
> out_unlock:
> inode_unlock(inode);
> @@ -771,7 +772,7 @@ int chown_common(const struct path *path, uid_t user, gid_t group)
> from_vfsuid(idmap, fs_userns, newattrs.ia_vfsuid),
> from_vfsgid(idmap, fs_userns, newattrs.ia_vfsgid));
> if (!error)
> - error = notify_change(idmap, path->dentry, &newattrs,
> + error = notify_change(idmap, path, &newattrs,
>      &delegated_inode);
> inode_unlock(inode);
> if (delegated_inode) {
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 4d0b278f5630..d1a1eaa1c00c 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -141,7 +141,9 @@ static inline int ovl_do_notify_change(struct ovl_fs *ofs,
>       struct dentry *upperdentry,
>       struct iattr *attr)
> {
> - return notify_change(ovl_upper_mnt_idmap(ofs), upperdentry, attr, NULL);
> + struct path path = { .mnt = ovl_upper_mnt(ofs), .dentry = upperdentry };
> +
> + return notify_change(ovl_upper_mnt_idmap(ofs), &path, attr, NULL);
> }
> 
> static inline int ovl_do_rmdir(struct ovl_fs *ofs,
> diff --git a/fs/utimes.c b/fs/utimes.c
> index 3701b3946f88..1e6b82b27899 100644
> --- a/fs/utimes.c
> +++ b/fs/utimes.c
> @@ -63,7 +63,7 @@ int vfs_utimes(const struct path *path, struct timespec64 *times)
> }
> retry_deleg:
> inode_lock(inode);
> - error = notify_change(mnt_idmap(path->mnt), path->dentry, &newattrs,
> + error = notify_change(mnt_idmap(path->mnt), path, &newattrs,
>      &delegated_inode);
> inode_unlock(inode);
> if (delegated_inode) {
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 21a981680856..dbba36ab4a1b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2333,7 +2333,7 @@ static inline bool is_idmapped_mnt(const struct vfsmount *mnt)
> }
> 
> extern long vfs_truncate(const struct path *, loff_t);
> -int do_truncate(struct mnt_idmap *, struct dentry *, loff_t start,
> +int do_truncate(struct mnt_idmap *, const struct path *, loff_t start,
> unsigned int time_attrs, struct file *filp);
> extern int vfs_fallocate(struct file *file, int mode, loff_t offset,
> loff_t len);
> @@ -2488,7 +2488,7 @@ static inline int bmap(struct inode *inode,  sector_t *block)
> }
> #endif
> 
> -int notify_change(struct mnt_idmap *, struct dentry *,
> +int notify_change(struct mnt_idmap *, const struct path *,
>  struct iattr *, struct inode **);
> int inode_permission(struct mnt_idmap *, struct inode *, int);
> int generic_permission(struct mnt_idmap *, struct inode *, int);
> -- 
> 2.17.1
> 

--
Chuck Lever


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

