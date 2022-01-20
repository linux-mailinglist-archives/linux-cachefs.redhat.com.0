Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27B494AE0
	for <lists+linux-cachefs@lfdr.de>; Thu, 20 Jan 2022 10:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642671476;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pbvd8MS9UhpvwpiFfCS3kqpJ7gIiL7b1PdH0st2jnko=;
	b=F2WBQ8sXLSXJGgc6usFK/pA0BLouAIQDZVJdgGsnkPX3C49kAOD7aj1XfY6gAi0xwv9LTo
	g74ZhyHBBEGZQ5NQ2ruilzXBkGUisLYU9s7iOs2AKq55tkhBp45n40bG2ChT0QtOzDTnup
	Q0ZKBroBbNElfBUY7i65UT3QDGTGyKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-CZsZtBjaNzGVD6S4kfGQjw-1; Thu, 20 Jan 2022 04:37:53 -0500
X-MC-Unique: CZsZtBjaNzGVD6S4kfGQjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F06B51091DA5;
	Thu, 20 Jan 2022 09:37:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9997A12E3B;
	Thu, 20 Jan 2022 09:37:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 238401806D1C;
	Thu, 20 Jan 2022 09:37:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20K9bko0019275 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 20 Jan 2022 04:37:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9B2C316A5E; Thu, 20 Jan 2022 09:37:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B386D131CC;
	Thu, 20 Jan 2022 09:37:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YekmpeQvNlGlMvNY@infradead.org>
References: <YekmpeQvNlGlMvNY@infradead.org> <YeefizLOGt1Qf35o@infradead.org>
	<YebpktrcUZOlBHkZ@infradead.org>
	<164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
	<164251409447.3435901.10092442643336534999.stgit@warthog.procyon.org.uk>
	<3613681.1642527614@warthog.procyon.org.uk>
	<3765724.1642583885@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@infradead.org>
MIME-Version: 1.0
Date: Thu, 20 Jan 2022 09:37:20 +0000
Message-ID: <58090.1642671440@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH 09/11] vfs,
	fscache: Add an IS_KERNEL_FILE() macro for the S_KERNEL_FILE flag
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
Content-ID: <58089.1642671440.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph Hellwig <hch@infradead.org> wrote:

> But you tricked Linus

Tricked?  I put a notice explicitly pointing out that I was adding it and
indicating that it might be controversial in the cover note and the pull
request and further explained the use in the patches that handle it.  I posted
the patches adding/using it a bunch of times to various mailing lists.  TYVM.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

