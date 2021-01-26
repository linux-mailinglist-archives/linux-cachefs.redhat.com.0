Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 123FA3045AD
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 18:49:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-2VScY5BMOZWQRN2O4noipA-1; Tue, 26 Jan 2021 12:49:35 -0500
X-MC-Unique: 2VScY5BMOZWQRN2O4noipA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABFEB1005504;
	Tue, 26 Jan 2021 17:49:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 050A260C5F;
	Tue, 26 Jan 2021 17:49:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA4F6180954D;
	Tue, 26 Jan 2021 17:49:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QHnOSg003640 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 12:49:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A251A2166B2D; Tue, 26 Jan 2021 17:49:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C1AC2166B29
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 17:49:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EE1B811E76
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 17:49:22 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-5ph6bSfIMoWYdgYL2lThXg-1; Tue, 26 Jan 2021 12:49:20 -0500
X-MC-Unique: 5ph6bSfIMoWYdgYL2lThXg-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	10QFOdtw032245; Tue, 26 Jan 2021 15:24:39 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 368brkjg46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Jan 2021 15:24:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	10QFKCMd172700; Tue, 26 Jan 2021 15:24:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by userp3030.oracle.com with ESMTP id 368wqwhsdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Jan 2021 15:24:34 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
	by BYAPR10MB2870.namprd10.prod.outlook.com (2603:10b6:a03:8d::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13;
	Tue, 26 Jan 2021 15:24:32 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
	([fe80::6da8:6d28:b83:702b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
	([fe80::6da8:6d28:b83:702b%4]) with mapi id 15.20.3784.019;
	Tue, 26 Jan 2021 15:24:32 +0000
From: Chuck Lever <chuck.lever@oracle.com>
To: Matthew Wilcox <willy@infradead.org>, David Howells <dhowells@redhat.com>, 
	Dave Wysochanski <dwysocha@redhat.com>
Thread-Topic: [PATCH 32/32] NFS: Convert readpage to readahead and use
	netfs_readahead for fscache
Thread-Index: AQHW82MzEY7Udq3xF0mVxFQYNQk01w==
Date: Tue, 26 Jan 2021 15:24:31 +0000
Message-ID: <D6C85B77-17CA-4BA6-9C2C-C63A8AF613AB@oracle.com>
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
	<161161064956.2537118.3354798147866150631.stgit@warthog.procyon.org.uk>
	<20210126013611.GI308988@casper.infradead.org>
In-Reply-To: <20210126013611.GI308988@casper.infradead.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.61.232.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04f828bb-8954-4996-f5ac-08d8c20e7afb
x-ms-traffictypediagnostic: BYAPR10MB2870:
x-microsoft-antispam-prvs: <BYAPR10MB2870DEB5FD262BCF64E6EE2193BC9@BYAPR10MB2870.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 6IhxpFKT2Muz2ZfUadsZPZr9bomlmXz8UbO/XOzhlZaxeEsyAlklY9dbdxDmAoStKxXs9THlZqP7nUiJyvZbKN4t5pp5YSZmMXgg2gfLzWVq0eaDiOXPW5Ei3jrk7YbicY1z4GyomqaMXoz1Xn5EjybFo8ZVnvyHEmxLfg9OGhdM+4vaq5EfjDT5j5jT2MZSZqWSLxRGBrKZDNZcmww5HyPEqptQMm8jMZ9O52hKRTFHADb1Tb9B+M2dsl5o3t9HxutN3lwuBMFIwdqYgOQqkgMO8DjsSqXmvwdr2l/Sl/Vn56e39915fSoDMf5AuisLU2MIb4uw9ArTFDCopCXjL8fVQu1oB8fZCOTWXyaBcjw3aDx/G2OIzfID5LGV8uhnfb5FlIAgiAvKQ8rhofrUSxln4H6yqC2M5mr5vOjNSjh6odgaMBCN+ObD0fN82O4FItMbXXZMMrXyVQfUo7/sB0fJ0Vn+Tzuog+elveBVeWzCUBn/DpISVjNfRsflFnz3L+hjyYGI7mYSIL1IeIdPcHEJVhcB8T8uLSdqtLnynVMAuv2B+2vPMj88zV544ZG331+Z7pKkQGatHkR0zyyhnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(366004)(376002)(136003)(396003)(346002)(7416002)(66946007)(33656002)(2616005)(6512007)(91956017)(76116006)(5660300002)(8676002)(186003)(4326008)(8936002)(2906002)(66556008)(54906003)(64756008)(478600001)(44832011)(66476007)(66446008)(110136005)(36756003)(86362001)(316002)(6506007)(53546011)(83380400001)(6486002)(26005)(71200400001)(45980500001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2C447poday5LjZJ/hFasOfwgDPkszhHhM6yTMIW7AHY7XsPQlW5Eo43r8sye?=
	=?us-ascii?Q?G8PvQ1EhofkmczOhLNqtyOot7Dk3xElj79l15k1wa5wlI6CEPApRxEq9cIxq?=
	=?us-ascii?Q?3Mi7bbPcOIhtyuu9l4O6/tCWcvBeo8GJ7C/b38/icKvr5yZv/IrqAJ2QVIy9?=
	=?us-ascii?Q?WmxlaftK+4kYxQrWAQnTNc8tXdGfGk2QT30Bx1HuZl1NdmBm2fFpoM9AGyTv?=
	=?us-ascii?Q?hD8vbRHtfFH4k7WBDDXZltdIdyvUZcZvG9PTgx9SKrxaM6C9GAv8BwLmrHso?=
	=?us-ascii?Q?lPXiHFOeHJwsZh8kCg0DyUyZF9EcX1H2CM0aUi8VovPCncBXbACLd0balOuP?=
	=?us-ascii?Q?ds0ADAue2ougxnz1gG5ir9wXIfYYrup6Rse42e17KdTmW4cyNU6rc/8KDU61?=
	=?us-ascii?Q?olY5aGzVjt1YVjU72PyjbZTz0mnIGT94CKlKrRwSbNUfSiWgqP98/Fw67xsc?=
	=?us-ascii?Q?lRjgxQ0fBSrtr/evOM2Wp25xSH/OyQ8vOYroVhU7owFQXuwULfySukMn8iKK?=
	=?us-ascii?Q?dl1hUwZPfMy061Li9rMUOHVDMxMT0NAD7EfsjY7vyJDRNnMdq3l0tAgxmc6R?=
	=?us-ascii?Q?QLSj3+vPchDCRL8WG9tCQ5Z4bGhVQ0iir22PrQua3EvxCwRvTbLu7IiuUQnv?=
	=?us-ascii?Q?PBfNoRFr02vy3yDUE53NH50+uR202bqWO+HMpzVXa7qgcDZlhMsG1hLhG2AV?=
	=?us-ascii?Q?lA6CAfT/hrd0JROfMA1c89Q//csmu98c3IxJ1l0L0xIhba33rZQH5Rzmw2t6?=
	=?us-ascii?Q?6DgUsOnZ+Apz0KSR44wHuHcCWIGHtJGNEp8wciw+AFBUcnC0NdVyMp4t1PIM?=
	=?us-ascii?Q?35vNAq/l/5ZY2g6+Z/FjzQ/c/pGZKF0uIt6SrrDsTE/0KusSvfc/JsRTKuWA?=
	=?us-ascii?Q?AiCSEwGkYaRa8wxOnGMGn0ParRLncAbHSZD2ZJk/xBXTjC+qowhzt24WC+3G?=
	=?us-ascii?Q?Mh1CNh9gd1Rh90nFQXE0nvebe24D8l21j74vGWQ0Idsqqb3YXhscoTsOd8HH?=
	=?us-ascii?Q?DTxeWFOc3HW3/d6YIiu8uKg1NaeWiI7wwS7qUAUP+RAgVbkvR/OwRO14A/LZ?=
	=?us-ascii?Q?vx36xwW7PEpOuWJBF+WhAx5RB6I7Lw=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f828bb-8954-4996-f5ac-08d8c20e7afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 15:24:31.9657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oxUQfISdZn4Unci5ovLH412F+URCEp//5xGN6xRm2luk+WGfznX5C66iWC+RCO/UGh8VULsiK/HED4AvIj7ngw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2870
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	spamscore=0 phishscore=0
	adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2101260084
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	impostorscore=0
	phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
	lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
	clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2101260084
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10QHnOSg003640
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, Mailing List <linux-nfs@vger.kernel.org>,
	Dominique, Martinet <asmadeus@codewreck.org>, Linux,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	Steve French <sfrench@samba.org>, linux-cachefs <linux-cachefs@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"v9fs-developer@lists.sourceforge.net"
	<v9fs-developer@lists.sourceforge.net>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 32/32] NFS: Convert readpage to
 readahead and use netfs_readahead for fscache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <DCC33538A9AE0E4E84CB4C014FB5E2A8@namprd10.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Jan 25, 2021, at 8:36 PM, Matthew Wilcox <willy@infradead.org> wrote:
> 
> 
> For Subject: s/readpage/readpages/
> 
> On Mon, Jan 25, 2021 at 09:37:29PM +0000, David Howells wrote:
>> +int __nfs_readahead_from_fscache(struct nfs_readdesc *desc,
>> +				 struct readahead_control *rac)
> 
> I thought you wanted it called ractl instead of rac?  That's what I've
> been using in new code.
> 
>> -	dfprintk(FSCACHE, "NFS: nfs_getpages_from_fscache (0x%p/%u/0x%p)\n",
>> -		 nfs_i_fscache(inode), npages, inode);
>> +	dfprintk(FSCACHE, "NFS: nfs_readahead_from_fscache (0x%p/0x%p)\n",
>> +		 nfs_i_fscache(inode), inode);
> 
> We do have readahead_count() if this is useful information to be logging.

As a sidebar, the Linux NFS community is transitioning to tracepoints.
It would be helpful (but not completely necessary) to use tracepoints
in new code instead of printk.


>> +static inline int nfs_readahead_from_fscache(struct nfs_readdesc *desc,
>> +					     struct readahead_control *rac)
>> {
>> -	if (NFS_I(inode)->fscache)
>> -		return __nfs_readpages_from_fscache(ctx, inode, mapping, pages,
>> -						    nr_pages);
>> +	if (NFS_I(rac->mapping->host)->fscache)
>> +		return __nfs_readahead_from_fscache(desc, rac);
>> 	return -ENOBUFS;
>> }
> 
> Not entirely sure that it's worth having the two functions separated any more.
> 
>> 	/* attempt to read as many of the pages as possible from the cache
>> 	 * - this returns -ENOBUFS immediately if the cookie is negative
>> 	 */
>> -	ret = nfs_readpages_from_fscache(desc.ctx, inode, mapping,
>> -					 pages, &nr_pages);
>> +	ret = nfs_readahead_from_fscache(&desc, rac);
>> 	if (ret == 0)
>> 		goto read_complete; /* all pages were read */
>> 
>> 	nfs_pageio_init_read(&desc.pgio, inode, false,
>> 			     &nfs_async_read_completion_ops);
>> 
>> -	ret = read_cache_pages(mapping, pages, readpage_async_filler, &desc);
>> +	while ((page = readahead_page(rac))) {
>> +		ret = readpage_async_filler(&desc, page);
>> +		put_page(page);
>> +	}
> 
> I thought with the new API we didn't need to do this kind of thing
> any more?  ie no matter whether fscache is configured in or not, it'll
> submit the I/Os.

--
Chuck Lever




--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

