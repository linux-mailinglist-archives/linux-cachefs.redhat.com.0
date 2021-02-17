Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D9DFB31DBC5
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 15:59:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-eneW0j7bPAK1YEKFII41SA-1; Wed, 17 Feb 2021 09:59:56 -0500
X-MC-Unique: eneW0j7bPAK1YEKFII41SA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02D66192D785;
	Wed, 17 Feb 2021 14:59:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C032A60C61;
	Wed, 17 Feb 2021 14:59:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F01A257DFA;
	Wed, 17 Feb 2021 14:59:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HExoXF008075 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 09:59:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 30C2A20614DF; Wed, 17 Feb 2021 14:59:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B8D520614D9
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 14:59:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDF91851795
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 14:59:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-229-C91jfZ_3PDGDuoL7zSGbHQ-1;
	Wed, 17 Feb 2021 09:59:43 -0500
X-MC-Unique: C91jfZ_3PDGDuoL7zSGbHQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1615F64E2F;
	Wed, 17 Feb 2021 14:59:40 +0000 (UTC)
Message-ID: <67964c5a81822bf8d6562fbaaef0d43ef2f9f9bd.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 17 Feb 2021 09:59:39 -0500
In-Reply-To: <20210217143857.GK2858050@casper.infradead.org>
References: <20210217125845.10319-1-jlayton@kernel.org>
	<20210217125845.10319-3-jlayton@kernel.org>
	<20210217143857.GK2858050@casper.infradead.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11HExoXF008075
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v2 2/6] ceph: rework PageFsCache handling
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-02-17 at 14:38 +0000, Matthew Wilcox wrote:
> On Wed, Feb 17, 2021 at 07:58:41AM -0500, Jeff Layton wrote:
> > -static int ceph_releasepage(struct page *page, gfp_t g)
> > +static int ceph_releasepage(struct page *page, gfp_t gfp_flags)
> > =A0{
> > =A0=09dout("%p releasepage %p idx %lu (%sdirty)\n", page->mapping->host=
,
> > =A0=09     page, page->index, PageDirty(page) ? "" : "not ");
> > =A0
> >=20
> > +=09if (PageFsCache(page)) {
> > +=09=09if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_F=
S))
>=20
> If you called it 'gfp' instead of 'gfp_flags', you wouldn't go over 80
> columns ;-)
>=20
> =09=09if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
>=20

Fair enough -- I'll fix it up since you mentioned it. ;)
--=20
Jeff Layton <jlayton@kernel.org>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

