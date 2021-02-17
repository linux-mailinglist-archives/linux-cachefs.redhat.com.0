Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFF0322854
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614074391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AK6EeoWWM6HWngiPnWZ2oc9qASY2wK+b+DPeqvsUucI=;
	b=aCCBEGRTb6gxcVAL518rUFXU/xBK0f/ZAi9oTSCe4WVT8RTpmwn1ObZFbSOna5GJlsSzzp
	HhdjIqv87Z1PnaUPA8s7Ii/G4RsvuTgs3QNj2JoZkFJdiPfKDXiwaeqP5Wy9LtETrld67C
	wXUfsxA8Jrn7S4plNjDkuX8bE1PSE9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-r0mC2u2NNT6bgJPRVDIVNA-1; Tue, 23 Feb 2021 04:59:49 -0500
X-MC-Unique: r0mC2u2NNT6bgJPRVDIVNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A09376D4F4;
	Tue, 23 Feb 2021 09:59:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91CEA77715;
	Tue, 23 Feb 2021 09:59:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B1F258075;
	Tue, 23 Feb 2021 09:59:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HMYtVp013279 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 17:34:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BD41060C62; Wed, 17 Feb 2021 22:34:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0F6E60C61;
	Wed, 17 Feb 2021 22:34:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210217161358.GM2858050@casper.infradead.org>
References: <20210217161358.GM2858050@casper.infradead.org>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Wed, 17 Feb 2021 22:34:39 +0000
Message-ID: <1901187.1613601279@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:26 -0500
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [PATCH 03/33] mm: Implement readahead_control
	pageset expansion
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
Content-ID: <1901186.1613601279.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> We're defeating the ondemand_readahead() algorithm here.  Let's suppose
> userspace is doing 64kB reads, the filesystem is OrangeFS which only
> wants to do 4MB reads, the page cache is initially empty and there's
> only one thread doing a sequential read.  ondemand_readahead() calls
> get_init_ra_size() which tells it to allocate 128kB and set the async
> marker at 64kB.  Then orangefs calls readahead_expand() to allocate the
> remainder of the 4MB.  After the app has read the first 64kB, it comes
> back to read the next 64kB, sees the readahead marker and tries to trigger
> the next batch of readahead, but it's already present, so it does nothing
> (see page_cache_ra_unbounded() for what happens with pages present).

It sounds like Christoph is right on the right track and the vm needs to ask
the filesystem (and by extension, the cache) before doing the allocation and
before setting the trigger flag.  Then we don't need to call back into the vm
to expand the readahead.

Also, there's Steve's request to try and keep at least two requests in flight
for CIFS/SMB at the same time to consider.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

