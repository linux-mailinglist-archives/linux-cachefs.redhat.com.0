Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E903494AD9
	for <lists+linux-cachefs@lfdr.de>; Thu, 20 Jan 2022 10:34:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-v3iqWTgYM16Uh6yWzT5K6Q-1; Thu, 20 Jan 2022 04:34:50 -0500
X-MC-Unique: v3iqWTgYM16Uh6yWzT5K6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0AC18519E1;
	Thu, 20 Jan 2022 09:34:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00C857CADB;
	Thu, 20 Jan 2022 09:34:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84D381809CBA;
	Thu, 20 Jan 2022 09:34:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20K9V7Nn018928 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 20 Jan 2022 04:31:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFABC40F9D74; Thu, 20 Jan 2022 09:31:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2B940F9D73
	for <linux-cachefs@redhat.com>; Thu, 20 Jan 2022 09:31:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B27B4811E7A
	for <linux-cachefs@redhat.com>; Thu, 20 Jan 2022 09:31:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-630-hLmpCjNEOYOi38ZB1NZO5g-1; Thu, 20 Jan 2022 04:31:06 -0500
X-MC-Unique: hLmpCjNEOYOi38ZB1NZO5g-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nATR7-00A4wf-Az; Thu, 20 Jan 2022 09:08:53 +0000
Date: Thu, 20 Jan 2022 01:08:53 -0800
From: Christoph Hellwig <hch@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YekmpeQvNlGlMvNY@infradead.org>
References: <YeefizLOGt1Qf35o@infradead.org> <YebpktrcUZOlBHkZ@infradead.org>
	<164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
	<164251409447.3435901.10092442643336534999.stgit@warthog.procyon.org.uk>
	<3613681.1642527614@warthog.procyon.org.uk>
	<3765724.1642583885@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3765724.1642583885@warthog.procyon.org.uk>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 19, 2022 at 09:18:05AM +0000, David Howells wrote:
> The flag cannot just be dropped - it's an important part of the interaction
> with cachefilesd with regard to culling.  Culling to free up space is
> offloaded to userspace rather than being done within the kernel.
> 
> Previously, cachefiles, the kernel module, had to maintain a huge tree of
> records of every backing inode that it was currently using so that it could
> forbid cachefilesd to cull one when cachefilesd asked.  I've reduced that to a
> single bit flag on the inode struct, thereby saving both memory and time.  You
> can argue whether it's worth sacrificing an inode flag bit for that, but the
> flag can be reused for any other kernel service that wants to similarly mark
> an inode in use.

Which is a horrible interface.   But you tricked Linus into merging this
crap, so let's not pretent it is a "kernel file".  We have plenty of
those, basically every caller of filp_open is one.

It is something like "pinned for fscache/cachefiles", so name it that
way and add a big fat comment expaining the atrocities.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

