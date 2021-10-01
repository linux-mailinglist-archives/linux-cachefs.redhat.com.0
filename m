Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 633DA41F621
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Oct 2021 22:07:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-Nw_w9PXBMeWY0FiZN3rBgQ-1; Fri, 01 Oct 2021 16:07:00 -0400
X-MC-Unique: Nw_w9PXBMeWY0FiZN3rBgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 160131B18BC1;
	Fri,  1 Oct 2021 20:06:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8444B19C59;
	Fri,  1 Oct 2021 20:06:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F6A51800B8B;
	Fri,  1 Oct 2021 20:06:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 191K6odQ012805 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 16:06:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 26DCBAECA9; Fri,  1 Oct 2021 20:06:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2160AD7B03
	for <linux-cachefs@redhat.com>; Fri,  1 Oct 2021 20:06:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F27F1800141
	for <linux-cachefs@redhat.com>; Fri,  1 Oct 2021 20:06:38 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-430-vjI3YXrMPvC8HZNvJxUA0A-1; Fri, 01 Oct 2021 16:06:37 -0400
X-MC-Unique: vjI3YXrMPvC8HZNvJxUA0A-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mWOQT-00EDKy-Sm; Fri, 01 Oct 2021 19:42:39 +0000
Date: Fri, 1 Oct 2021 20:42:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <YVdkqUrwcPUqhF6d@casper.infradead.org>
References: <97eb17f51c8fd9a89f10d9dd0bf35f1075f6b236.camel@hammerspace.com>
	<163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk>
	<163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk>
	<CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
	<81120.1633099916@warthog.procyon.org.uk>
	<23033528036059af4633f60b8325e48eab95ac36.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <23033528036059af4633f60b8325e48eab95ac36.camel@hammerspace.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] Can the GFP flags to releasepage() be trusted?
 -- was Re: [PATCH v2 3/8] nfs: Move to using the alternate fallback fscache
 I/O API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 01, 2021 at 03:04:08PM +0000, Trond Myklebust wrote:
> On Fri, 2021-10-01 at 15:51 +0100, David Howells wrote:
> > Trond Myklebust <trondmy@hammerspace.com> wrote:
> >=20
> > > > > @@ -432,7 +432,12 @@ static int nfs_release_page(struct page
> > > > > *page, gfp_t gfp)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0/* If PagePrivate() is set, then the page=
 is not
> > > > > freeable */
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0if (PagePrivate(page))
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > > > -=A0=A0=A0=A0=A0=A0=A0return nfs_fscache_release_page(page, gfp);
> > > > > +=A0=A0=A0=A0=A0=A0=A0if (PageFsCache(page)) {
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (!(gfp & __GFP_D=
IRECT_RECLAIM) || !(gfp &
> > > > > __GFP_FS))
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0return false;
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0wait_on_page_fscach=
e(page);
> > > > > +=A0=A0=A0=A0=A0=A0=A0}
> > > > > +=A0=A0=A0=A0=A0=A0=A0return true;
> > > > > =A0}
> > >=20
> > > I've found this generally not to be safe. The VM calls -
> > > >release_page()
> > > from a variety of contexts, and often fails to report it correctly
> > > in
> > > the gfp flags. That's particularly true of the stuff in
> > > mm/vmscan.c.
> > > This is why we have the check above that vetos page removal upon
> > > PagePrivate() being set.
> >=20
> > [Adding Willy and the mm crew to the cc list]
> >=20
> > I wonder if that matters in this case.=A0 In the worst case, we'll wait
> > for the
> > page to cease being DMA'd - but we won't return true if it is.
> >=20
> > But if vmscan is generating the wrong VM flags, we should look at
> > fixing that.
> >=20
> >=20
>=20
> To elaborate a bit: we used to have code here that would check whether
> the page had been cleaned but was unstable, and if an argument of
> GFP_KERNEL or above was set, we'd try to call COMMIT to ensure the page
> was synched to disk on the server (and we'd wait for that call to
> complete).
>=20
> That code would end up deadlocking in all sorts of horrible ways, so we
> ended up having to pull it.

Based on having read zero code at all in this area ...

Is it possible that you can wait for an existing operation to finish,
but starting a new operation will take a lock that is already being
held somewhere in your call chain?  So it's not that the gfp flags are
being set incorrectly, it's just that you're not in a context where you
can start a new operation.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

