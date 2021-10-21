Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F3C437E7A
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:19:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-gTOxjM66MfWahderZeVa3w-1; Fri, 22 Oct 2021 15:19:08 -0400
X-MC-Unique: gTOxjM66MfWahderZeVa3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C64E18D6A2A;
	Fri, 22 Oct 2021 19:19:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CE6F60C04;
	Fri, 22 Oct 2021 19:19:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16B9B4EA2A;
	Fri, 22 Oct 2021 19:19:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LMKhfO009647 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 18:20:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D116F40C1257; Thu, 21 Oct 2021 22:20:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD2B4400F3E5
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 22:20:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5484899EC1
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 22:20:43 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-227-9nwWH3E1NHeCYUEIbw1yTw-1; Thu, 21 Oct 2021 18:20:41 -0400
X-MC-Unique: 9nwWH3E1NHeCYUEIbw1yTw-1
Received: by mail-pj1-f44.google.com with SMTP id
	pi19-20020a17090b1e5300b0019fdd3557d3so1598389pjb.5
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 15:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=tSebnyNuofgB+vH+7uyEvZ4tUVxD1t6yZgP5DdCdt6U=;
	b=dVwSAURGHv6eUijxXg+qUPVdrpKpfk0ni0l1u9vWm6XpRL2Erjqk4Ee8aEpv4BYU8A
	0BG4hqg4nHBaCI/lKWzX1RTg1licOFPsnQ1Dyl46Xf50GJMAawJD+6UJhWkOAn9JykTM
	D9dCcOXQSK/oj3P628kSaVPmB9D4qFZnb+IGdTw64oDQynl8zyC3VnvD/jqJi12a8aP6
	cOwlPH0z7K+iUYrPk6iUZy4ExRmonPlXSZE0jz+ScoaxtbaqzT41gjlo3NwuIPJP6pJw
	JAsIxA5QkRe/NvsBQAv/uGmSDLRBUsfB2gNHdRtwAy2CYY3Y0EY+y1EIex05sJwnsaOF
	rrQA==
X-Gm-Message-State: AOAM532LmA374nBdwoNSthnWV83Y1CtRaofVFi9TjwcVOpX3AQHyg6ej
	Ixba0A2bPhAv7UCkker5qpJuVg==
X-Google-Smtp-Source: ABdhPJwPCYMB5mXDn/964xDyH1fZwMCe0wUF+PkkOcGHAMNid1VUJ2pJtdpAOgiix5LMUW5jc9KZFg==
X-Received: by 2002:a17:90b:1041:: with SMTP id
	gq1mr9693769pjb.31.1634854840491; 
	Thu, 21 Oct 2021 15:20:40 -0700 (PDT)
Received: from relinquished.localdomain ([2620:10d:c090:400::5:69a9])
	by smtp.gmail.com with ESMTPSA id
	n22sm6962317pjv.22.2021.10.21.15.20.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Oct 2021 15:20:40 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:20:36 -0700
From: Omar Sandoval <osandov@osandov.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <YXHntB2O0ACr0pbz@relinquished.localdomain>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 22 Oct 2021 15:19:03 -0400
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>,
	linux-cifs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com, Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
	linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/67] fscache: Rewrite index API and
	management system
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 03:50:15PM +0100, David Howells wrote:
> 
> Here's a set of patches that rewrites and simplifies the fscache index API
> to remove the complex operation scheduling and object state machine in
> favour of something much smaller and simpler.  It is built on top of the
> set of patches that removes the old API[1].
> 
> The operation scheduling API was intended to handle sequencing of cache
> operations, which were all required (where possible) to run asynchronously
> in parallel with the operations being done by the network filesystem, while
> allowing the cache to be brought online and offline and interrupt service
> with invalidation.
> 
> However, with the advent of the tmpfile capacity in the VFS, an opportunity
> arises to do invalidation much more easily, without having to wait for I/O
> that's actually in progress: Cachefiles can simply cut over its file
> pointer for the backing object attached to a cookie and abandon the
> in-progress I/O, dismissing it upon completion.
> 
> Future work there would involve using Omar Sandoval's vfs_link() with
> AT_LINK_REPLACE[2] to allow an extant file to be displaced by a new hard
> link from a tmpfile as currently I have to unlink the old file first.

I had forgotten about that. It'd be great to finish that someday, but
given the dead-end of the last discussion [1], we might need to hash it
out the next time we can convene in person.

1:https://lore.kernel.org/linux-fsdevel/364531.1579265357@warthog.procyon.org.uk/ 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

