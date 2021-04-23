Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80AE736A9DE
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 01:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619393160;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KJuZRoZVIonWWWW1vaB7lNIrNy4LaoJwLeRQ9zAcjRc=;
	b=dVD4wDu5HZLaZuFV5gCCRJcMg5qOmSbl5x11K/nT7ujaYH3eVeTXeBxH7uB3gxLF5vsZ+P
	vBhJXK3ER64pqi6iGbjVVGIsjGuiJlk4AZSsoYW6hcz+xoJnP7IhOuGX3ejYuWBMQSrCXW
	PAA8gtCrUieDX7pLNrETLvFGMPPJCgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-sXVJfHbJOJGZVIh5D1aw9g-1; Sun, 25 Apr 2021 19:25:58 -0400
X-MC-Unique: sXVJfHbJOJGZVIh5D1aw9g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96991107ACCD;
	Sun, 25 Apr 2021 23:25:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF39F614FA;
	Sun, 25 Apr 2021 23:25:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B95524ED7A;
	Sun, 25 Apr 2021 23:25:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13NEXMgJ028837 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 23 Apr 2021 10:33:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CAB55DEAD; Fri, 23 Apr 2021 14:33:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-124.rdu2.redhat.com
	[10.10.112.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3B2960C25;
	Fri, 23 Apr 2021 14:33:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210423140625.GC235567@casper.infradead.org>
References: <20210423140625.GC235567@casper.infradead.org>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Fri, 23 Apr 2021 15:33:14 +0100
Message-ID: <3153358.1619188394@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sun, 25 Apr 2021 19:25:51 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Steve French <sfrench@samba.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v7 01/31] iov_iter: Add ITER_XARRAY
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3153357.1619188393.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> On Fri, Apr 23, 2021 at 02:28:01PM +0100, David Howells wrote:
> Now, is this important?  There are no filesystems which do I/O to THPs
> today.  So it's not possible to pick up the fact that it doesn't work,
> and I hope to have the page cache fixed soon.  And fixing this now
> will create more work later as part of fixing the page cache.  But I
> wouldn't feel right not mentioning this problem ...

So I can leave the code as-is for the moment and it can be fixed with your
patches?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

