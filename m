Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 02476322856
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614074392;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9ee6aoVAZFZug5qe4jNPWqHsrnIzdlx8hP+1cxDWlpM=;
	b=BM4BBA3f3jPWau8jtFX4WdeLmWohrdT4Pw0WizVDm2rUrJu+NnPi2+9pGDH0W+oGkcAyx9
	0bDQzlrscjr7vkjaeWvjJNwvhskGYeQ6tPwuR96AHWQtt3bFBB4S6a0Dw+YyOYUDwhHxyy
	4KdaKkumfp9dCr+dqF+wa2gynNBi8h4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-HsJaEdHdM5OcHCyjmQqrkg-1; Tue, 23 Feb 2021 04:59:50 -0500
X-MC-Unique: HsJaEdHdM5OcHCyjmQqrkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42BDA801B17;
	Tue, 23 Feb 2021 09:59:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FF065D9D3;
	Tue, 23 Feb 2021 09:59:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1ABB518095CB;
	Tue, 23 Feb 2021 09:59:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11G9Tea0013871 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 04:29:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0853310023B1; Tue, 16 Feb 2021 09:29:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 709A110023AB;
	Tue, 16 Feb 2021 09:29:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210216084230.GA23669@lst.de>
References: <20210216084230.GA23669@lst.de>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<1376938.1613429183@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Date: Tue, 16 Feb 2021 09:29:31 +0000
Message-ID: <1419965.1613467771@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:25 -0500
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [Linux-cachefs] [PATCH 34/33] netfs: Use in_interrupt() not
	in_softirq()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1419964.1613467771.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph Hellwig <hch@lst.de> wrote:

> On Mon, Feb 15, 2021 at 10:46:23PM +0000, David Howells wrote:
> > The in_softirq() in netfs_rreq_terminated() works fine for the cache being
> > on a normal disk, as the completion handlers may get called in softirq
> > context, but for an NVMe drive, the completion handler may get called in
> > IRQ context.
> > 
> > Fix to use in_interrupt() instead of in_softirq() throughout the read
> > helpers, particularly when deciding whether to punt code that might sleep
> > off to a worker thread.
> 
> We must not use either check, as they all are unreliable especially
> for PREEMPT-RT.

Is there a better way to do it?  The intent is to process the assessment phase
in the calling thread's context if possible rather than bumping over to a
worker thread.  For synchronous I/O, for example, that's done in the caller's
thread.  Maybe that's the answer - if it's known to be asynchronous, I have to
punt, but otherwise don't have to.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

