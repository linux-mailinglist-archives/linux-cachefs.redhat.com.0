Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D434934DC
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 Jan 2022 07:11:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-nrEPfm2LO_Wi-ek1IgOtWw-1; Wed, 19 Jan 2022 01:11:37 -0500
X-MC-Unique: nrEPfm2LO_Wi-ek1IgOtWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DE3F835B47;
	Wed, 19 Jan 2022 06:11:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F773108B8;
	Wed, 19 Jan 2022 06:11:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 016414CA93;
	Wed, 19 Jan 2022 06:11:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20J6BLxq003239 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 01:11:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2BC9E1121335; Wed, 19 Jan 2022 06:11:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 269251121333
	for <linux-cachefs@redhat.com>; Wed, 19 Jan 2022 06:11:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BC36185A7B4
	for <linux-cachefs@redhat.com>; Wed, 19 Jan 2022 06:11:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-606-fc06swd2O5q_jtmdOG9SbQ-1; Wed, 19 Jan 2022 01:11:16 -0500
X-MC-Unique: fc06swd2O5q_jtmdOG9SbQ-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nA3OF-003qhc-Es; Wed, 19 Jan 2022 05:20:11 +0000
Date: Tue, 18 Jan 2022 21:20:11 -0800
From: Christoph Hellwig <hch@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YeefizLOGt1Qf35o@infradead.org>
References: <YebpktrcUZOlBHkZ@infradead.org>
	<164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
	<164251409447.3435901.10092442643336534999.stgit@warthog.procyon.org.uk>
	<3613681.1642527614@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3613681.1642527614@warthog.procyon.org.uk>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 18, 2022 at 05:40:14PM +0000, David Howells wrote:
> Christoph Hellwig <hch@infradead.org> wrote:
> 
> > On Tue, Jan 18, 2022 at 01:54:54PM +0000, David Howells wrote:
> > > Add an IS_KERNEL_FILE() macro to test the S_KERNEL_FILE inode flag as is
> > > common practice for the other inode flags[1].
> > 
> > Please fix the flag to have a sensible name first, as the naming of the
> > flag and this new helper is utterly wrong as we already discussed.
> 
> And I suggested a new name, which you didn't comment on.

Again, look at the semantics of the flag:  The only thing it does in the
VFS is to prevent a rmdir.  So you might want to name it after that.

Or in fact drop the flag entirely.  We don't have that kind of
protection for other in-kernel file use or important userspace daemons
either.  I can't see why cachefiles is the magic snowflake here that
suddenly needs semantics no one else has.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

