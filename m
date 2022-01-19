Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FAA49396B
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 Jan 2022 12:22:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Uekk6WeCM7-f7EXWfw7uQA-1; Wed, 19 Jan 2022 06:22:49 -0500
X-MC-Unique: Uekk6WeCM7-f7EXWfw7uQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8C00814243;
	Wed, 19 Jan 2022 11:22:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56F427958B;
	Wed, 19 Jan 2022 11:22:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 052C91809CB8;
	Wed, 19 Jan 2022 11:22:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JBMaMU026714 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 06:22:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1602040F9D6E; Wed, 19 Jan 2022 11:22:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 034A340F9D68
	for <linux-cachefs@redhat.com>; Wed, 19 Jan 2022 11:22:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE635811E78
	for <linux-cachefs@redhat.com>; Wed, 19 Jan 2022 11:22:35 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-54-YOMyOhS6MnWlJZi1D4rKeg-1; Wed, 19 Jan 2022 06:22:34 -0500
X-MC-Unique: YOMyOhS6MnWlJZi1D4rKeg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E44AB81900;
	Wed, 19 Jan 2022 11:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EC8C004E1;
	Wed, 19 Jan 2022 11:15:59 +0000 (UTC)
Date: Wed, 19 Jan 2022 12:15:57 +0100
From: Christian Brauner <brauner@kernel.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20220119111557.gjrjwgib2wgteir6@wittgenstein>
References: <YeefizLOGt1Qf35o@infradead.org> <YebpktrcUZOlBHkZ@infradead.org>
	<164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
	<164251409447.3435901.10092442643336534999.stgit@warthog.procyon.org.uk>
	<3613681.1642527614@warthog.procyon.org.uk>
	<3765724.1642583885@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3765724.1642583885@warthog.procyon.org.uk>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 19, 2022 at 09:18:05AM +0000, David Howells wrote:
> Christoph Hellwig <hch@infradead.org> wrote:
> 
> > On Tue, Jan 18, 2022 at 05:40:14PM +0000, David Howells wrote:
> > > Christoph Hellwig <hch@infradead.org> wrote:
> > > 
> > > > On Tue, Jan 18, 2022 at 01:54:54PM +0000, David Howells wrote:
> > > > > Add an IS_KERNEL_FILE() macro to test the S_KERNEL_FILE inode flag as is
> > > > > common practice for the other inode flags[1].
> > > > 
> > > > Please fix the flag to have a sensible name first, as the naming of the
> > > > flag and this new helper is utterly wrong as we already discussed.
> > > 
> > > And I suggested a new name, which you didn't comment on.
> > 
> > Again, look at the semantics of the flag:  The only thing it does in the
> > VFS is to prevent a rmdir.  So you might want to name it after that.
> > 
> > Or in fact drop the flag entirely.  We don't have that kind of
> > protection for other in-kernel file use or important userspace daemons
> > either.  I can't see why cachefiles is the magic snowflake here that
> > suddenly needs semantics no one else has.
> 
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
> 
> Further, it's used as a mark to prevent cachefiles accidentally using an inode
> twice - say someone misconfigures a second cache overlapping the first - and,
> again, this works if some other kernel driver wants to mark inode it is using
> in use.  Cachefiles will refuse to use them if it ever sees them, so no
> problem there.
> 
> And it's not true that we don't have that kind of protection for other
> in-kernel file use.  See S_SWAPFILE.  I did consider using that, but that has
> other side effects.  I mentioned that perhaps I should make swapon set
> S_KERNEL_FILE also.  Also blockdevs have some exclusion also, I think.
> 
> The rmdir thing should really apply to rename and unlink also.  That's to
> prevent someone, cachefilesd included, causing cachefiles to malfunction by
> removing the directories it created.  Possibly this should be a separate bit
> to S_KERNEL_FILE, maybe S_NO_DELETE.
> 
> So I could change S_KERNEL_FILE to S_KERNEL_LOCK, say, or maybe S_EXCLUSIVE.

[ ] S_REMOVE_PROTECTED
[ ] S_UNREMOVABLE
[ ] S_HELD_BUSY
[ ] S_KERNEL_BUSY
[ ] S_BUSY_INTERNAL
[ ] S_BUSY
[ ] S_HELD

?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

