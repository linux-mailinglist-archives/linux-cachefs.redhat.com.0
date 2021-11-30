Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8D463BDC
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Nov 2021 17:34:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-_w9BopnhPuOZAfp8nbO0zQ-1; Tue, 30 Nov 2021 11:34:53 -0500
X-MC-Unique: _w9BopnhPuOZAfp8nbO0zQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C60FA193F562;
	Tue, 30 Nov 2021 16:34:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 093425D6BA;
	Tue, 30 Nov 2021 16:34:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7AD51806D2B;
	Tue, 30 Nov 2021 16:34:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUGMJgY001563 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 11:22:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BDB3B492C3B; Tue, 30 Nov 2021 16:22:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9680492C38
	for <linux-cachefs@redhat.com>; Tue, 30 Nov 2021 16:22:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A08F281B55E
	for <linux-cachefs@redhat.com>; Tue, 30 Nov 2021 16:22:19 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-428-5N9V3wvBNqSCQ-KHrLFFPQ-1; Tue, 30 Nov 2021 11:22:17 -0500
X-MC-Unique: 5N9V3wvBNqSCQ-KHrLFFPQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6818FCE1A0D;
	Tue, 30 Nov 2021 16:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB047C53FC1;
	Tue, 30 Nov 2021 16:15:09 +0000 (UTC)
Date: Tue, 30 Nov 2021 09:15:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YaZOCk9zxApPattb@archlinux-ax161>
References: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
	<163819647945.215744.17827962047487125939.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <163819647945.215744.17827962047487125939.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 30 Nov 2021 11:34:44 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	llvm@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 51/64] cachefiles: Implement the I/O
	routines
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 29, 2021 at 02:34:39PM +0000, David Howells wrote:
> Implement the I/O routines for cachefiles.  There are two sets of routines
> here: preparation and actual I/O.
> 
> Preparation for read involves looking to see whether there is data present,
> and how much.  Netfslib tells us what it wants us to do and we have the
> option of adjusting shrinking and telling it whether to read from the
> cache, download from the server or simply clear a region.
> 
> Preparation for write involves checking for space and defending against
> possibly running short of space, if necessary punching out a hole in the
> file so that we don't leave old data in the cache if we update the
> coherency information.
> 
> Then there's a read routine and a write routine.  They wait for the cookie
> state to move to something appropriate and then start a potentially
> asynchronous direct I/O operation upon it.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com

This patch as commit 0443b01eccbb ("cachefiles: Implement the I/O
routines") in -next causes the following clang warning/error:

fs/cachefiles/io.c:489:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        if (pos == 0)
            ^~~~~~~~
fs/cachefiles/io.c:492:6: note: uninitialized use occurs here
        if (ret < 0) {
            ^~~
fs/cachefiles/io.c:489:2: note: remove the 'if' if its condition is always true
        if (pos == 0)
        ^~~~~~~~~~~~~
fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to silence this warning
        int ret;
               ^
                = 0
1 error generated.

It is the same one that has been reported two other times over the past
two months:

https://lore.kernel.org/r/202110150048.HPNa2Mn7-lkp@intel.com/
https://lore.kernel.org/r/202111070451.bsfAyznx-lkp@intel.com/

Should ret just be initialized to zero or does it need to be set to
something else if pos is not equal to zero at the end?

Cheers,
Nathan

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

