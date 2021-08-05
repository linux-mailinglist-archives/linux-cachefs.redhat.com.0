Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 840463E1ACE
	for <lists+linux-cachefs@lfdr.de>; Thu,  5 Aug 2021 19:52:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-3eq-UgNSONGMMJZG1l3C9w-1; Thu, 05 Aug 2021 13:52:54 -0400
X-MC-Unique: 3eq-UgNSONGMMJZG1l3C9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A65831006C80;
	Thu,  5 Aug 2021 17:52:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4FD560BF4;
	Thu,  5 Aug 2021 17:52:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 387094BB7C;
	Thu,  5 Aug 2021 17:52:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 175HhMVN009346 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 5 Aug 2021 13:43:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 337E7202144D; Thu,  5 Aug 2021 17:43:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DCD02028677
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 17:43:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC5C68007B1
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 17:43:18 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam08on2119.outbound.protection.outlook.com [40.107.102.119])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-f_0BLevPOFKmUN-KGeGROA-1; Thu, 05 Aug 2021 13:43:16 -0400
X-MC-Unique: f_0BLevPOFKmUN-KGeGROA-1
Received: from DM8PR13MB5079.namprd13.prod.outlook.com (2603:10b6:8:22::9) by
	DM6PR13MB2587.namprd13.prod.outlook.com (2603:10b6:5:136::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4415.5; Thu, 5 Aug 2021 17:43:11 +0000
Received: from DM8PR13MB5079.namprd13.prod.outlook.com
	([fe80::9925:b22d:a3ca:1ff0]) by
	DM8PR13MB5079.namprd13.prod.outlook.com
	([fe80::9925:b22d:a3ca:1ff0%8]) with mapi id 15.20.4415.007;
	Thu, 5 Aug 2021 17:43:09 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"dhowells@redhat.com" <dhowells@redhat.com>
Thread-Topic: Canvassing for network filesystem write size vs page size
Thread-Index: AQHXihf6hOJE9a6TVUqeuJkvzGR9DKtlKgiAgAAEfAA=
Date: Thu, 5 Aug 2021 17:43:09 +0000
Message-ID: <0211d015a215b3d343bfbaad838179c41a1289c5.camel@hammerspace.com>
References: <YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
	<CAHk-=wjyEk9EuYgE3nBnRCRd_AmRYVOGACEjt0X33QnORd5-ig@mail.gmail.com>
In-Reply-To: <CAHk-=wjyEk9EuYgE3nBnRCRd_AmRYVOGACEjt0X33QnORd5-ig@mail.gmail.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c059a2b4-935e-45d3-7d5c-08d958387d90
x-ms-traffictypediagnostic: DM6PR13MB2587:
x-microsoft-antispam-prvs: <DM6PR13MB2587E9A923097C370557D08BB8F29@DM6PR13MB2587.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: hhJLbU1LmvOD36x9I1N7c9qJlsLCO+4N6/DGtE/y2OmsuZx4w9W67a96VcfKC9x/uQfVUtavT0zqiljnnDE1ng52mn2KqhnS/m7vFo+td/q0+OoZgwnQXAmobQcbcJ3uEknniSc+3D2T7ZXnUkumCffMBNFolWRht7D6QgNCYvwvdn0MOkCNfoYViJz8HzJmtEj1JaUa6TlMu24ipr5agOPxL79lt9zAPDEAAU1g10gIxJc9KnxWdj2+A0Oc00yJYDjaLO7dX5Jm2yInaiZpmcsqxs7j9ZCxEPQi2cYdhLw9m7bDPo/WC8MEQk/6a3Q4M6H/s4HCGa1iNZRx8oxnyVJidZyxeInp/XhFbMqjTKPW4/AVQdXYwz0tjOqbSlXwgiuejT7nCsF2AFycZVGZcCQV7sjvLF6/GzLnMcCh+craoF7ymoqVJ04QoqLAaxCaZS4KVZ0UOiLjb66mJb//NDVPjqVM1AIZ2dv/f1Ghf2dp2OhoA+KzBsMeRcRUzveIrXArZnQ8XWSIv6sF6TU4H5+83Tw3eEImzC48NGvQvU0B08SxsAPtJ3fcpaFGfMbwIVXMgcaRMikKQ5zYAe8UAPrKBV2Wi160GqKsqKDoih2d/fz6AT9ZwMTWudOk9IUh0A+JfIXtXf7Zj9OY8qH3JVllg+zkeg7rCsu8TbQKsDuGMG+lJ0koL1KdPBsBIl1ZMMZd0Obqq7JUzl/shoJqcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM8PR13MB5079.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(346002)(136003)(376002)(39830400003)(366004)(83380400001)(26005)(2616005)(71200400001)(5660300002)(4326008)(122000001)(38100700002)(316002)(36756003)(86362001)(2906002)(186003)(7416002)(110136005)(66556008)(91956017)(76116006)(66946007)(8676002)(6506007)(6486002)(54906003)(8936002)(53546011)(64756008)(66446008)(66476007)(38070700005)(478600001)(6512007);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXl0WkdkTitFWktpNGlOSTJDRlV6Qm1YRUhBOVdsVWhhVUJBL1lnNlF0VHBO?=
	=?utf-8?B?NUpJdXFVYm1UcTR3cHpjUmg1elpWaVZNUDJjZmpmVVlqNUs0L3p3VGxwekhr?=
	=?utf-8?B?WmRQck1VQmtmSFVLTGhJTVh4enI0Q1k5ZEtScXBXTFdiUDRERlU2RGhDNjky?=
	=?utf-8?B?bEFkZDh3cldOalZIYzBuMDUvSzlsNUVGS3BvZy9tN1FBMWJtTkx5T2JMRExQ?=
	=?utf-8?B?WkFEYzBRUlBSZ1JaQjZpR3RLVmpzeW1XMkFEc1NPUWZPL0t1cjMrUXVvQkdr?=
	=?utf-8?B?ZEZ5N0lQY2lxRXBiWnZtRFBYWXBpMHVGTUdQSUZzOStXMEtYRXkwUnBWZGYr?=
	=?utf-8?B?aEVSOEYyWDBkTzdodmVSSWw4TVNrSVZQb0g2bFlxTGNTeHVUN1R5dkUwY1N1?=
	=?utf-8?B?Qk5vY0ZDQkg5UDQyWHJzK1NHcjBoalkvU2hTc3pkZjhlSWFlSy9tRVVFS3A3?=
	=?utf-8?B?OGxDcitMc3Q4MUhsVzVBdC84U2lYT3kwd0s5Ny8zck1KWWVEMUZ5K2dTeDRW?=
	=?utf-8?B?eWxqQXZFVG8rREFJakxNOTBOVUZKNGxlWWhzUXlNdmVtbkdZcTJOK01pc01w?=
	=?utf-8?B?dmZyMzZKeTc1RkN5ZklUTHR6dkY2Um1nSy9qSm9uaGF2cXc1UkRpYUp5ck14?=
	=?utf-8?B?KzRwYlRiSGpiWHArQzA2SisxMEM5d1BNVjMxMS9TYys3YUxvWDBaNWFTc21v?=
	=?utf-8?B?UXMrY0J3dzhPNllVK2Q4NHd4TVF6NlR5T1RTSVJRMGxVeFJpT28zdko3bXRB?=
	=?utf-8?B?Um14cE5IWDdPbTc0YmkweDhhLzNUNXNYSGZWRnBBK1MwNmJFN3ZaK2xmUHNJ?=
	=?utf-8?B?YmNHek1aMTZlRWdDTTYrSVNuMlZ2S3hkL0w1Unl0ZUJnYjJkeFNjaElPQkZ4?=
	=?utf-8?B?ZUU3OGpncTM5dXZJdzlkRDF4MENJZkdMV1RyVE0wZ3VhRGZtcHBubGM4aDMy?=
	=?utf-8?B?dzhqbDlPczNtak5JV1Nua3lZNXZGVkI1Y25PcjgwbXc5Y2FRdzV6Z0RsN3VT?=
	=?utf-8?B?aWV0RXh3YkhpZVJQSDFBcDVnVWNkWTZJMGZJK1pKRTExMU54Zm0rZ2lBVFRn?=
	=?utf-8?B?RHVjNFBIamxvQzFsczdVZmpHRzM3aWVmRW5xSDdmbW1iM2hYR2NXVGYvd3NX?=
	=?utf-8?B?OVBTRGxEZzNibUdCNG5OcmtOSVZXc2VLR0JHQzFYTHRWU3ZTQVhBbm5RU0p3?=
	=?utf-8?B?UnQxZC8xVnE0bjdOTVZiVmc4WSt0UUxHR3VSa2JHblU0TXEzM1gzN09aWCtI?=
	=?utf-8?B?RUxWRitvaFNpenlmR0Q4WjlyWDNtcDRvVTBjUFNOaW1zQ2JEQ1dTQzRDVHBW?=
	=?utf-8?B?SjZadE9OQnlvbkRRZmpTcXVOZjdsYzFKYXpSUktYa2NRMytKRHp1cnZ0TmJY?=
	=?utf-8?B?aldnLzNEOXdqT3liRWxTNnVNejFVdUN5dStpUGJpSURST3V3T0ZsekQybk4x?=
	=?utf-8?B?b0ZLY1BrR09LcWpPeTVLak1USHJqTEp3TjgraElBSVN5a0pIRCtSK0R2UW9U?=
	=?utf-8?B?SWtBcDVEeVp6b3VteUFHdVZxWmF4QzBaL2dyUmhObi94NDd0SkYwWmNtcGt4?=
	=?utf-8?B?NHVHWUhWdnVBQksvVUZBWWtPYVQxRGxMdEkwWnU4MUFWb3RDTUQzY2U5dlNY?=
	=?utf-8?B?WTZUQlFoVFpCdm9Ec3hjV3Z3MlJEc000NFJmaE9UQU9EbHcweG1kMkVFSnlD?=
	=?utf-8?B?NzhLSlkvWUNzemF0SGNjZ1JGL25Qc0x4QnlsZ1BKTmdKLzhUdG54R2QyWnVK?=
	=?utf-8?Q?CIwBaq0kgbHrgcxgTYl1ORKPo/bAfaLu2B3K2//?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR13MB5079.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c059a2b4-935e-45d3-7d5c-08d958387d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 17:43:09.5907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZrRqt1XZfI7KssT+eRIfBJ3XPC2DbGV37fMWHrcHvtTzKLc+9L7YS9dHWmyGsO+NT3m6S52NJq0gcK1etuPZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB2587
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 175HhMVN009346
X-loop: linux-cachefs@redhat.com
Cc: "nspmangalore@gmail.com" <nspmangalore@gmail.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"miklos@szeredi.hu" <miklos@szeredi.hu>,
	"asmadeus@codewreck.org" <asmadeus@codewreck.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"sfrench@samba.org" <sfrench@samba.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"v9fs-developer@lists.sourceforge.net"
	<v9fs-developer@lists.sourceforge.net>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>,
	"devel@lists.orangefs.org" <devel@lists.orangefs.org>,
	"hubcap@omnibond.com" <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] Canvassing for network filesystem write size vs
	page size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <3A876B5C48B7204BA119B27766ED960F@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-05 at 10:27 -0700, Linus Torvalds wrote:
> On Thu, Aug 5, 2021 at 9:36 AM David Howells <dhowells@redhat.com>
> wrote:
> > 
> > Some network filesystems, however, currently keep track of which
> > byte ranges
> > are modified within a dirty page (AFS does; NFS seems to also) and
> > only write
> > out the modified data.
> 
> NFS definitely does. I haven't used NFS in two decades, but I worked
> on some of the code (read: I made nfs use the page cache both for
> reading and writing) back in my Transmeta days, because NFSv2 was the
> default filesystem setup back then.
> 
> See fs/nfs/write.c, although I have to admit that I don't recognize
> that code any more.
> 
> It's fairly important to be able to do streaming writes without
> having
> to read the old contents for some loads. And read-modify-write cycles
> are death for performance, so you really want to coalesce writes
> until
> you have the whole page.
> 
> That said, I suspect it's also *very* filesystem-specific, to the
> point where it might not be worth trying to do in some generic
> manner.
> 
> In particular, NFS had things like interesting credential issues, so
> if you have multiple concurrent writers that used different 'struct
> file *' to write to the file, you can't just mix the writes. You have
> to sync the writes from one writer before you start the writes for
> the
> next one, because one might succeed and the other not.
> 
> So you can't just treat it as some random "page cache with dirty byte
> extents". You really have to be careful about credentials, timeouts,
> etc, and the pending writes have to keep a fair amount of state
> around.
> 
> At least that was the case two decades ago.
> 
> [ goes off and looks. See "nfs_write_begin()" and friends in
> fs/nfs/file.c for some of the examples of these things, althjough it
> looks like the code is less aggressive about avoding the
> read-modify-write case than I thought I remembered, and only does it
> for write-only opens ]
> 

All correct, however there is also the issue that even if we have done
a read-modify-write, we can't always extend the write to cover the
entire page.

If you look at nfs_can_extend_write(), you'll note that we don't extend
the page data if the file is range locked, if the attributes have not
been revalidated, or if the page cache contents are suspected to be
invalid for some other reason.

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

