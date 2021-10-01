Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB9D641F002
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Oct 2021 16:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633099936;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gFcIEk8IdQNXLbihaEGdIlMHy03iWB6PP9AAuiAF8hU=;
	b=Sd8fFDguRfO4/7jvcJAVFldd22UGkeEh1Fh3XSKLytxO5r6K028Qu2uqrLltmj+04Xbeu8
	mPqxn6tL1IDW5QS3DCxWped1L6y6BuCi62AMCWHQg7H+EyiDlXNfDUpA419Hz/u3Hn0yj/
	/6zPUYuglsCoVoUMxMW75gva9FmMB8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-hw6v23AiPH-IBg5n-xz-BQ-1; Fri, 01 Oct 2021 10:52:16 -0400
X-MC-Unique: hw6v23AiPH-IBg5n-xz-BQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEC5A1006AA4;
	Fri,  1 Oct 2021 14:52:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF8F45D6BA;
	Fri,  1 Oct 2021 14:52:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DD814EA2A;
	Fri,  1 Oct 2021 14:52:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 191EqAi2018726 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 10:52:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D31F360936; Fri,  1 Oct 2021 14:52:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A59815BAE0;
	Fri,  1 Oct 2021 14:51:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <97eb17f51c8fd9a89f10d9dd0bf35f1075f6b236.camel@hammerspace.com>
References: <97eb17f51c8fd9a89f10d9dd0bf35f1075f6b236.camel@hammerspace.com>
	<163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk>
	<163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk>
	<CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
MIME-Version: 1.0
Date: Fri, 01 Oct 2021 15:51:56 +0100
Message-ID: <81120.1633099916@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 191EqAi2018726
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com, anna.schumaker@netapp.com
Subject: [Linux-cachefs] Can the GFP flags to releasepage() be trusted? --
	was Re: [PATCH v2 3/8] nfs: Move to using the alternate
	fallback fscache I/O API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <81119.1633099916.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Trond Myklebust <trondmy@hammerspace.com> wrote:

> > > @@ -432,7 +432,12 @@ static int nfs_release_page(struct page *page, gfp_t gfp)
> > >  	/* If PagePrivate() is set, then the page is not freeable */
> > >  	if (PagePrivate(page))
> > >  		return 0;
> > > -	return nfs_fscache_release_page(page, gfp);
> > > +	if (PageFsCache(page)) {
> > > +		if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
> > > +			return false;
> > > +		wait_on_page_fscache(page);
> > > +	}
> > > +	return true;
> > >  }
> 
> I've found this generally not to be safe. The VM calls ->release_page()
> from a variety of contexts, and often fails to report it correctly in
> the gfp flags. That's particularly true of the stuff in mm/vmscan.c.
> This is why we have the check above that vetos page removal upon
> PagePrivate() being set.

[Adding Willy and the mm crew to the cc list]

I wonder if that matters in this case.  In the worst case, we'll wait for the
page to cease being DMA'd - but we won't return true if it is.

But if vmscan is generating the wrong VM flags, we should look at fixing that.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

