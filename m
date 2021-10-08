Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A4FFE427090
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Oct 2021 20:11:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-2-VfquryN0WTuJjSHNo3kg-1; Fri, 08 Oct 2021 14:11:17 -0400
X-MC-Unique: 2-VfquryN0WTuJjSHNo3kg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E42B8ED7A8;
	Fri,  8 Oct 2021 18:10:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7A7E10016FF;
	Fri,  8 Oct 2021 18:10:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 827851809C84;
	Fri,  8 Oct 2021 18:10:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 198IAWer020577 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 8 Oct 2021 14:10:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E8E32166B26; Fri,  8 Oct 2021 18:10:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 086702166B2F
	for <linux-cachefs@redhat.com>; Fri,  8 Oct 2021 18:10:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE09185704F
	for <linux-cachefs@redhat.com>; Fri,  8 Oct 2021 18:10:31 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-164-C9Rw0q2RPvWu4qePU1w8GA-1; Fri, 08 Oct 2021 14:10:30 -0400
X-MC-Unique: C9Rw0q2RPvWu4qePU1w8GA-1
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	198DIfaq001319; Fri, 8 Oct 2021 14:09:46 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3bj1ecqxn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Oct 2021 14:09:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 198E4tHs108042;
	Fri, 8 Oct 2021 14:09:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
	(mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by userp3020.oracle.com with ESMTP id 3bf16yfbdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Oct 2021 14:09:43 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
	by BY5PR10MB4147.namprd10.prod.outlook.com (2603:10b6:a03:20e::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19;
	Fri, 8 Oct 2021 14:09:40 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
	([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
	([fe80::f4fe:5b4:6bd9:4c5b%6]) with mapi id 15.20.4587.022;
	Fri, 8 Oct 2021 14:09:40 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Dave Wysochanski <dwysocha@redhat.com>
Thread-Topic: [PATCH 1/1] NFS: Convert from readpages() to readahead()
Thread-Index: AQHXu9PCTxWz7e0uNku4Se2Jl0pkd6vJJJuA
Date: Fri, 8 Oct 2021 14:09:40 +0000
Message-ID: <3F1E7B93-EB8D-4744-8143-D44654CA6451@oracle.com>
References: <1633649528-1321-1-git-send-email-dwysocha@redhat.com>
	<1633649528-1321-2-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633649528-1321-2-git-send-email-dwysocha@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c95f3064-3907-4150-a026-08d98a654557
x-ms-traffictypediagnostic: BY5PR10MB4147:
x-microsoft-antispam-prvs: <BY5PR10MB4147185C6F2789172198F60493B29@BY5PR10MB4147.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: ACGEUW9wdMI1VpDgKZwAn41b7mQ9/Q8kCLrsWBrQBjwQ63bi8BkyZkF5PYbLzb8OrZCWOdbUUnDQAIxn56xWsPTgJqP/xVs/mu9DxIse43JIoSsf/aHODv10rH8Bne1Pq2l1VAJKrHkVSn4ZXVTaXe68+80+AYCTuTe8AZjh1zWv0Wof0mLW0ERgsU66CbY8wQQW37g7AuKW/T5BlLA5pBPVYMd0nh1ZnP2MgqcQXhx08GzGNQVsPvWqK/aGVmxZIHjOT3hKXvqubRoMzlsCT6xyBPeo+fpCEYwDoIW1/7AftERjaVeILfFywPyhEKkoWw6orUmPEqnzUJI6lhTpkr3onCQE5NKii3VnegOZ8lP8tkupr4yF5uCcPOuFgkPtHjekObZzmw/9iIGEFGJiMMUUfY6Q4f6G8O2K9Fw5/iXpVbTWPiYssfJVRhni4iaPaJI+ysX1U2ZedQ2USvNaXwt9PKZgUDeDennXje/n+SESsTPSNTA0FDp9y0b1iZLoYqPtNOGPPU38ufityuEqSKXIO9hWMl7Tn49C2vJrmSAn0nPzeoZ1JzQfEbzluBD7vkWIAX0ztQ4Q1ZF/14lOYjOyHJ3HNNnd8ozIE2yYkInioCVW7jI3enN7vnjuoeThx/6X6M7h6hsMUVLCzMWz/dOtQUDQVloiMP71FSAPr6mZxPMvlxEHMCwQ4WDET6tuu37xwwFVJuDc8TT1fly8joAkyoKUTBfIXJaUCb1B0s2BnkmvtoQrwrgY3845V2aZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(4326008)(38100700002)(6506007)(122000001)(8676002)(33656002)(186003)(38070700005)(26005)(2616005)(53546011)(86362001)(8936002)(71200400001)(36756003)(6512007)(6916009)(66556008)(66446008)(91956017)(2906002)(66946007)(66476007)(64756008)(76116006)(6486002)(83380400001)(5660300002)(316002)(54906003)(508600001)(45980500001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U7CYwaRphin7MIP1gGG0fT5dSxc8OF9AcNj6hGXLKMWaUfPACeMOGUQLdnun?=
	=?us-ascii?Q?phR1+uPLr3duMa+yBDvoOxfsCQ0e1QDPrd4ZuQz56M8qJ7/r1i8ZAySsNDO0?=
	=?us-ascii?Q?FYxhg+l70cYZYjwzYtjX69BYiL8u0q/i0mj9IkgbalcajRsOIM0TojTzBilv?=
	=?us-ascii?Q?D4KXI+66Bn3iVwzO8GhAVesd7EBqmY+eB0nctXVLtGgVsQ6IPX0XFutF4UMc?=
	=?us-ascii?Q?L51BuWMGS1ko1DydVkM1+02PwB1FPmZhF5xPJnW6+jP/7PpmpeTz2pt4BYAz?=
	=?us-ascii?Q?gh2oD9Ke9Ald/FNU4C2vhIxidivgo9oz4GCnuHRKK7aRQPZjuocyYUlU0gLD?=
	=?us-ascii?Q?oPSfQD/c9zUFDchZf9zXQbxqLl0uhb/CDBXTm3hkDWnjgl4qBduNsB+X2n//?=
	=?us-ascii?Q?GLMT0KV+p0jQyy6+eKtfvBHVLAbCyIHuhiJcwFt+fhgLwvSKEZYlZVdgBs9a?=
	=?us-ascii?Q?0vUvtcxKHalAzl5FOPmVrIH2j4UMexAgZYu2sPFATSc0T59vUIxCrqBRcIxq?=
	=?us-ascii?Q?X7+zDGAxuUJGkbKVlYqZBL4donzGfJ8TXT8D4e+bHIDhJ568RITqw3p+mDqH?=
	=?us-ascii?Q?Qf6dh4IbI3BhXg5DUbEfDlOCTUwcpYynwKb4pX1GCvrbKuXXNS0fcAsg1mXO?=
	=?us-ascii?Q?HI+FtdGulNtISPN2ouvm3KKTWVzRx95ecwBryUth+ifiL2inwffQ+6bTaWtT?=
	=?us-ascii?Q?qWMeMRrkdEbVmjJw0PQ5DGNZ6phVg2P+82irgS9uj72AhwQ3BIHoDP0tsp6M?=
	=?us-ascii?Q?GUl0mT4fAgoIbe0nWDAs0zk/6z0NseRMgRO6MGRK20jCMy0s1UByqxIs0QLk?=
	=?us-ascii?Q?BhA8OOnN7eUUFVHkdPoRQb+a244gmV0wWPGq/cZU+Hk75LxSZt9Fla29prYd?=
	=?us-ascii?Q?lZuRD8v1DW+uNb6zyzjJTwsRV5md6eXcgCiOg7zebVogbxg0XyRGeP7/PIEh?=
	=?us-ascii?Q?n+OQqDRaafETQxViumtP2umq54Wv6d3SJcnedJdKRz/45z5jxsssErs58RKz?=
	=?us-ascii?Q?7dXivuPJg3JvNaNujImgujJ/f5gZtmBSbdRZfU5VqJZPd87YTVXdWtMbqwbA?=
	=?us-ascii?Q?CeSzk69uCXUdchGuO4LqKwFSPVEE3ubJdk6kwnaRiPMDpTaqi/39mL8A8R/b?=
	=?us-ascii?Q?A0+HOuC/aAoYRguOvRhCyrq7uK79Q2x804JskU/zd7Y9TgDA6JeghbP7FjHU?=
	=?us-ascii?Q?pHK73zU8cKB3cfSSlZ9PMcppYbsV2qtK2zHpY8RlIu+Z9DPhs+XLgLUVroVD?=
	=?us-ascii?Q?V/0cRWpgPi5Fct/oDo9yI5tp18HZVKuVHAwwTrSdmj3Z7k2u2XdWBrYivzyj?=
	=?us-ascii?Q?KiJ7HR743gzuJ3nzFE/SxTLd?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95f3064-3907-4150-a026-08d98a654557
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 14:09:40.8579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gq3bdS1t/n5Xfi4VVL3HQsrrs06w6IjBBiqtOsz8qtKm7p1ixcC/aYS/DBezWynNh0VlfyWvi6oAYNk/L+U9wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4147
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	adultscore=0
	phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2109230001 definitions=main-2110080085
X-Proofpoint-GUID: yC7vW5EJfEGDGEbFjHSa4whIBVoA-awy
X-Proofpoint-ORIG-GUID: yC7vW5EJfEGDGEbFjHSa4whIBVoA-awy
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 198IAWer020577
X-loop: linux-cachefs@redhat.com
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, David,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 1/1] NFS: Convert from readpages() to
	readahead()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <76B9179E6D11D244AAFF5891AB08D910@namprd10.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Oct 7, 2021, at 7:32 PM, Dave Wysochanski <dwysocha@redhat.com> wrote:
> 
> Convert to the new VM readahead() API which is the preferred API
> to read multiple pages, and rename the NFSIOS_* counters and the
> tracepoint as needed.
> 
> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> ---
> fs/nfs/file.c              |  2 +-
> fs/nfs/nfstrace.h          |  2 +-
> fs/nfs/read.c              | 21 +++++++++++++++------
> include/linux/nfs_fs.h     |  3 +--
> include/linux/nfs_iostat.h |  6 +++---
> 5 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 209dac208477..cc76d17fa97f 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -519,7 +519,7 @@ static void nfs_swap_deactivate(struct file *file)
> 
> const struct address_space_operations nfs_file_aops = {
> 	.readpage = nfs_readpage,
> -	.readpages = nfs_readpages,
> +	.readahead = nfs_readahead,
> 	.set_page_dirty = __set_page_dirty_nobuffers,
> 	.writepage = nfs_writepage,
> 	.writepages = nfs_writepages,
> diff --git a/fs/nfs/nfstrace.h b/fs/nfs/nfstrace.h
> index 78b0f649dd09..d2b2080765a6 100644
> --- a/fs/nfs/nfstrace.h
> +++ b/fs/nfs/nfstrace.h
> @@ -915,7 +915,7 @@
> 		)
> );
> 
> -TRACE_EVENT(nfs_aops_readpages,
> +TRACE_EVENT(nfs_aops_readahead,

In v2 and v3 of my patch, this tracepoint has already been
renamed to nfs_aop_readahead.


> 		TP_PROTO(
> 			const struct inode *inode,
> 			unsigned int nr_pages
> diff --git a/fs/nfs/read.c b/fs/nfs/read.c
> index 927504605e0f..5c2aab47cf1d 100644
> --- a/fs/nfs/read.c
> +++ b/fs/nfs/read.c
> @@ -395,15 +395,19 @@ int nfs_readpage(struct file *file, struct page *page)
> 	return ret;
> }
> 
> -int nfs_readpages(struct file *file, struct address_space *mapping,
> -		struct list_head *pages, unsigned nr_pages)
> +void nfs_readahead(struct readahead_control *ractl)
> {
> +	struct file *file = ractl->file;
> +	struct address_space *mapping = ractl->mapping;
> +	struct page *page;
> +	unsigned int nr_pages = readahead_count(ractl);
> +
> 	struct nfs_readdesc desc;
> 	struct inode *inode = mapping->host;
> 	int ret;
> 
> -	trace_nfs_aops_readpages(inode, nr_pages);
> -	nfs_inc_stats(inode, NFSIOS_VFSREADPAGES);
> +	trace_nfs_aops_readahead(inode, nr_pages);
> +	nfs_inc_stats(inode, NFSIOS_VFSREADAHEAD);
> 
> 	ret = -ESTALE;
> 	if (NFS_STALE(inode))
> @@ -420,13 +424,18 @@ int nfs_readpages(struct file *file, struct address_space *mapping,
> 	nfs_pageio_init_read(&desc.pgio, inode, false,
> 			     &nfs_async_read_completion_ops);
> 
> -	ret = read_cache_pages(mapping, pages, readpage_async_filler, &desc);
> +	ret = 0;
> +	while (!ret && (page = readahead_page(ractl))) {
> +		prefetchw(&page->flags);
> +		ret = readpage_async_filler(&desc, page);
> +		put_page(page);
> +	}
> 
> 	nfs_pageio_complete_read(&desc.pgio);
> 
> 	put_nfs_open_context(desc.ctx);
> out:
> -	return ret;
> +	return;
> }
> 
> int __init nfs_init_readpagecache(void)
> diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
> index b9a8b925db43..6cbe3f2c5669 100644
> --- a/include/linux/nfs_fs.h
> +++ b/include/linux/nfs_fs.h
> @@ -580,8 +580,7 @@ extern int nfs_access_get_cached(struct inode *inode, const struct cred *cred, s
>  * linux/fs/nfs/read.c
>  */
> extern int  nfs_readpage(struct file *, struct page *);
> -extern int  nfs_readpages(struct file *, struct address_space *,
> -		struct list_head *, unsigned);
> +extern void nfs_readahead(struct readahead_control *);
> 
> /*
>  * inline functions
> diff --git a/include/linux/nfs_iostat.h b/include/linux/nfs_iostat.h
> index 027874c36c88..418145f23700 100644
> --- a/include/linux/nfs_iostat.h
> +++ b/include/linux/nfs_iostat.h
> @@ -22,7 +22,7 @@
> #ifndef _LINUX_NFS_IOSTAT
> #define _LINUX_NFS_IOSTAT
> 
> -#define NFS_IOSTAT_VERS		"1.1"
> +#define NFS_IOSTAT_VERS		"1.2"
> 
> /*
>  * NFS byte counters
> @@ -53,7 +53,7 @@
>  * NFS page counters
>  *
>  * These count the number of pages read or written via nfs_readpage(),
> - * nfs_readpages(), or their write equivalents.
> + * nfs_readahead(), or their write equivalents.
>  *
>  * NB: When adding new byte counters, please include the measured
>  * units in the name of each byte counter to help users of this
> @@ -98,7 +98,7 @@ enum nfs_stat_eventcounters {
> 	NFSIOS_VFSACCESS,
> 	NFSIOS_VFSUPDATEPAGE,
> 	NFSIOS_VFSREADPAGE,
> -	NFSIOS_VFSREADPAGES,
> +	NFSIOS_VFSREADAHEAD,

I'm wondering if you should add NFSIOS_VFSREADAHEAD
but leave NFSIOS_VFSREADPAGES? I don't remember exactly
how the mountstats API versioning is supposed to work.


> 	NFSIOS_VFSWRITEPAGE,
> 	NFSIOS_VFSWRITEPAGES,
> 	NFSIOS_VFSGETDENTS,
> -- 
> 1.8.3.1
> 

--
Chuck Lever




--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

