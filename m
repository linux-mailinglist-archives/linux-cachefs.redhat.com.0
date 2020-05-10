Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EE4B71CCE9C
	for <lists+linux-cachefs@lfdr.de>; Mon, 11 May 2020 00:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589150619;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3KTnkd0US8SiVAsOZRGK2Vbo3HfVvmEZDziH9fni43w=;
	b=Jd2gFLxZCH+Wd5J7yxPKrJ07+4WcrWBEENTcVvcX6/8pRokH4+bdSlkQRx7gr9/SSudzRg
	foXER99e5ZVR99EIfZDJVJu2uZQ10qJJhP45Dn4+5Nc9v9Dfl9AvVhEBLmQHOlqagR9nX2
	TGRByXpfCIp4a/M6gg0InY+utika+pA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-7Iu5h9RJMGm35TCgX-Qigg-1; Sun, 10 May 2020 18:43:38 -0400
X-MC-Unique: 7Iu5h9RJMGm35TCgX-Qigg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AF488005B7;
	Sun, 10 May 2020 22:43:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BC965D9DA;
	Sun, 10 May 2020 22:43:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 759B24CA94;
	Sun, 10 May 2020 22:43:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04ADdDvQ019882 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 10 May 2020 09:39:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2806D951BF; Sun, 10 May 2020 13:39:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2309D951B1
	for <linux-cachefs@redhat.com>; Sun, 10 May 2020 13:39:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E77B7185A78B
	for <linux-cachefs@redhat.com>; Sun, 10 May 2020 13:39:10 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2114.outbound.protection.outlook.com [40.107.223.114])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-302-2pz4U1cfO5CGlCBBebUclA-1; Sun, 10 May 2020 09:39:06 -0400
X-MC-Unique: 2pz4U1cfO5CGlCBBebUclA-1
Received: from CH2PR13MB3398.namprd13.prod.outlook.com (2603:10b6:610:2a::33)
	by CH2PR13MB3607.namprd13.prod.outlook.com (2603:10b6:610:28::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.13;
	Sun, 10 May 2020 13:39:03 +0000
Received: from CH2PR13MB3398.namprd13.prod.outlook.com
	([fe80::49f6:ce9b:9803:2493]) by
	CH2PR13MB3398.namprd13.prod.outlook.com
	([fe80::49f6:ce9b:9803:2493%6]) with mapi id 15.20.3000.014;
	Sun, 10 May 2020 13:39:03 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"dhowells@redhat.com" <dhowells@redhat.com>
Thread-Topic: [PATCH 0/5] cachefiles, nfs: Fixes
Thread-Index: AQHWJYZfjpuxdZELmk6DUdcB+BLTBqihVa4A
Date: Sun, 10 May 2020 13:39:03 +0000
Message-ID: <d4efead1d6dba67f5c862a8d00ca88dd3c45dd34.camel@hammerspace.com>
References: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
In-Reply-To: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5816056e-63e4-40c5-8cb6-08d7f4e78124
x-ms-traffictypediagnostic: CH2PR13MB3607:
x-microsoft-antispam-prvs: <CH2PR13MB3607E79F5CE64155820481D9B8A00@CH2PR13MB3607.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 039975700A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3tZrJRNs1H1vgr45yXNez+KZDoFcagDu5ROzmMJXQk6NjRBb2HXQzvKNMGvvXwQPgUUtRfgKNi8Hj101FOCFnEw/1b5pSqONNCNIdSTW4TVqx/Ytdvur2xkFSmrhoLZLfq8vIskmGvrhg07qvQf09togl4NT8HuwGe47mKK+NtcBtkch2QttMvoBiSKkVd3GDdoFGoQ6aYMRV4tar/D/J2XtU5HjUaEYHOMaQqXdDsrwDuuP7XL6EKV3fYn5uIV+xtfdFKvMtz43wk3JEwHYWnBwwKh7eTZfjAEaJtA0YtDS2klOHC15LK3WoVnqJbOiz4qgK2MqZKVlIcfMjoyQbdIeLl7k+xruJZUNWxCDL05AvxLOZmyHktMuopCtrLa+66PZMTs0YQv1kwf8Yf7LLAgb3bjvjVUHa9YIGnn4YFBNZFWiH+GZpGi+0yNLAo4UgJjoRgJaCu9or2XdSkUx050iSUkU52V0KuxSYkYD5Q2Xxp+SXasrOAHAcnrXrDpykrWAxCTimccBeP18KHuDwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CH2PR13MB3398.namprd13.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(376002)(366004)(346002)(136003)(33430700001)(110136005)(54906003)(4326008)(6506007)(6512007)(26005)(186003)(2906002)(71200400001)(6486002)(5660300002)(86362001)(66556008)(66446008)(91956017)(8936002)(36756003)(76116006)(66946007)(8676002)(66476007)(508600001)(33440700001)(7416002)(2616005)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: WGeGTGxlSxfb7jC4lABoYrFgoCSGTWuYTwlZ8WPehStdKioQ2VyQsUo+TcWuKJrKuT4VVaxM/EXASyvUnWlRNTobwyDjl7AHzZc9PL15QLG2XXjOVqZp3/M3jlxmsW51ScM59MeE5RLz7ToqtfEEbZHn37fugaRPlO+R88+8A7YWyTdC18jyZOoFi05l/5Zn/Ce3VGbw30J+YCt1Rvi5NLdGiZhGK7z5uTHDB29WQFf0yDGEas7AyHIAEuSEuERmsf94oP16Or3rTuxJZuUS7yPZM2V8BUth+sKRHDmC+00EJ+9WMTHngmS+/Lr5owOiHvNEcWEWsKD1IzXmpXQaUmkyNJnJAYCxPDe2a8/KlV3FcbZKqOA6MrUVpaQYjQ6gRElFpf6mxGHn4JAdmdxJGBgcj/LEDOLfaK6iXRAHDRwEw51R/6MQwAiJvU1XNwfEqr8LbXPx5kMk07VF6UiqRMRSOWKCl/q1uRewB17aHls=
x-ms-exchange-transport-forked: True
Content-ID: <0EA20451C727ED44A0E8883B4FF0319D@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5816056e-63e4-40c5-8cb6-08d7f4e78124
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2020 13:39:03.6783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9t+XYVcqVx0nS/MMdM/gM2JLhvkU7TYBZxtm51QaUCOncp8QmF9woFoHIh7Dosxx+SityU5PTkE5U5HAbuF6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3607
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04ADdDvQ019882
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sun, 10 May 2020 18:43:29 -0400
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"carmark.dlut@gmail.com" <carmark.dlut@gmail.com>,
	"cmaiolino@redhat.com" <cmaiolino@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 0/5] cachefiles, nfs: Fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

On Fri, 2020-05-08 at 23:16 +0100, David Howells wrote:
> Hi Linus, Trond, Anna,
> 
> Can you pull these fixes for cachefiles and NFS's use of
> fscache?  Should
> they go through the NFS tree or directly upstream?  The things fixed
> are:
> 
>  (1) The reorganisation of bmap() use accidentally caused the return
> value
>      of cachefiles_read_or_alloc_pages() to get corrupted.
> 
>  (2) The NFS superblock index key accidentally got changed to include
> a
>      number of kernel pointers - meaning that the key isn't matchable
> after
>      a reboot.
> 
>  (3) A redundant check in nfs_fscache_get_super_cookie().
> 
>  (4) The NFS change_attr sometimes set in the auxiliary data for the
>      caching of an file and sometimes not, which causes the cache to
> get
>      discarded when it shouldn't.
> 
>  (5) There's a race between cachefiles_read_waiter() and
>      cachefiles_read_copier() that causes an occasional assertion
> failure.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-
> fs.git
> 	tag fscache-fixes-20200508-2
> 
> Thanks,
> David
> ---
> Dave Wysochanski (3):
>       NFS: Fix fscache super_cookie index_key from changing after
> umount
>       NFS: Fix fscache super_cookie allocation
>       NFSv4: Fix fscache cookie aux_data to ensure change_attr is
> included
> 
> David Howells (1):
>       cachefiles: Fix corruption of the return value in
> cachefiles_read_or_alloc_pages()
> 
> Lei Xue (1):
>       cachefiles: Fix race between read_waiter and read_copier
> involving op->to_do
> 
> 
>  fs/cachefiles/rdwr.c |   12 ++++++------
>  fs/nfs/fscache.c     |   39 ++++++++++++++++++---------------------
>  fs/nfs/super.c       |    1 -
>  3 files changed, 24 insertions(+), 28 deletions(-)
> 

I can pull this branch, and send it together with the NFS client
bugfixes for 5.7-rc5.


-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

