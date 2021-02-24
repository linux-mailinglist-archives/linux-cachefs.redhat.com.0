Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 17BEF329F9C
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Mar 2021 13:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614689770;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VAgVzFoJPVV2U75tIJAXbUnsHISRMCIuHoYM/e8qu/w=;
	b=ij4emNlBxHnjTA8RrKzQKjREK8Rka73zwN2oZonXJbIoKiQmjmbRDTVEBE2/mKPjCjbXED
	Xt3eCjKORFn1YskBE7NKDqxdacqMbxtRctWECyf8Ry9HCmrVFIPtHIwNrGn0zCa+Ialr6U
	3aO+ARPktMbIliZ+QKU0Ph1/x0Kb0FI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-bQK-YuFVM9yWU9_b4F1kpA-1; Tue, 02 Mar 2021 07:56:08 -0500
X-MC-Unique: bQK-YuFVM9yWU9_b4F1kpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 010DF801978;
	Tue,  2 Mar 2021 12:56:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7216260C15;
	Tue,  2 Mar 2021 12:56:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14E5318095CD;
	Tue,  2 Mar 2021 12:56:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ODW7PL015125 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 24 Feb 2021 08:32:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 812295DEFA; Wed, 24 Feb 2021 13:32:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 320E35D9F1;
	Wed, 24 Feb 2021 13:32:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAH2r5mv=PZk_wn2=b0VQcaom9TEw1MGLz+qB_Ktxxm2bnV9Nig@mail.gmail.com>
References: <CAH2r5mv=PZk_wn2=b0VQcaom9TEw1MGLz+qB_Ktxxm2bnV9Nig@mail.gmail.com>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
	<CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
	<20210216021015.GH2858050@casper.infradead.org>
To: Steve French <smfrench@gmail.com>
MIME-Version: 1.0
Date: Wed, 24 Feb 2021 13:32:02 +0000
Message-ID: <3743319.1614173522@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 02 Mar 2021 07:55:59 -0500
Cc: Steve French <sfrench@samba.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	CIFS <linux-cifs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/33] Network fs helper library &
	fscache kiocb API [ver #3]
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
Content-ID: <3743318.1614173522.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Steve French <smfrench@gmail.com> wrote:

> This (readahead behavior improvements in Linux, on single large file
> sequential read workloads like cp or grep) gets particularly interesting
> with SMB3 as multichannel becomes more common.  With one channel having one
> readahead request pending on the network is suboptimal - but not as bad as
> when multichannel is negotiated. Interestingly in most cases two network
> connections to the same server (different TCP sockets,but the same mount,
> even in cases where only network adapter) can achieve better performance -
> but still significantly lags Windows (and probably other clients) as in
> Linux we don't keep multiple I/Os in flight at one time (unless different
> files are being read at the same time by different threads).

I think it should be relatively straightforward to make the netfs_readahead()
function generate multiple read requests.  If I wasn't handed sufficient pages
by the VM upfront to do two or more read requests, I would need to do extra
expansion.  There are a couple of ways this could be done:

 (1) I could expand the readahead_control after fully starting a read request
     and then create another independent read request, and another for how
     ever many we want.

 (2) I could expand the readahead_control first to cover however many requests
     I'm going to generate, then chop it up into individual read requests.

However, generating larger requests means we're more likely to run into a
problem for the cache: if we can't allocate enough pages to fill out a cache
block, we don't have enough data to write to the cache.  Further, if the pages
are just unlocked and abandoned, readpage will be called to read them
individually - which means they likely won't get cached unless the cache
granularity is PAGE_SIZE.  But that's probably okay if ENOMEM occurred.

There are some other considerations too:

 (*) I would need to query the filesystem to find out if I should create
     another request.  The fs would have to keep track of how many I/O reqs
     are in flight and what the limit is.

 (*) How and where should the readahead triggers be emplaced?  I'm guessing
     that each block would need a trigger and that this should cause more
     requests to be generated until we hit the limit.

 (*) I would probably need to shuffle the request generation for the second
     and subsequent blocks in a single netfs_readahead() call to a worker
     thread because it'll probably be in a userspace kernel-side context and
     blocking an application from proceeding and consuming the pages already
     committed.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

