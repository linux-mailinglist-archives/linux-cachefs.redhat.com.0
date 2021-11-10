Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F544C23C
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Nov 2021 14:38:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-HlO76a8-OJetTAAO5ijJag-1; Wed, 10 Nov 2021 08:38:51 -0500
X-MC-Unique: HlO76a8-OJetTAAO5ijJag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD65283DC14;
	Wed, 10 Nov 2021 13:38:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B7A17C58;
	Wed, 10 Nov 2021 13:38:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4479E1832DD2;
	Wed, 10 Nov 2021 13:38:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AADX6tC014477 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 08:33:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BEE664010FE5; Wed, 10 Nov 2021 13:33:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA05C40CFD0B
	for <linux-cachefs@redhat.com>; Wed, 10 Nov 2021 13:33:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0F8A811E78
	for <linux-cachefs@redhat.com>; Wed, 10 Nov 2021 13:33:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-470-HCL9KzWsPFqMHfTUNtfYsA-1;
	Wed, 10 Nov 2021 08:33:05 -0500
X-MC-Unique: HCL9KzWsPFqMHfTUNtfYsA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA7C6611AD;
	Wed, 10 Nov 2021 13:33:02 +0000 (UTC)
Message-ID: <a0212b723317677e8601b3f58927eab03ef784de.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>
Date: Wed, 10 Nov 2021 08:33:01 -0500
In-Reply-To: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
References: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35)
MIME-Version: 1.0
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
	kafs-testing@auristor.com, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org,
	devel@lists.orangefs.org
Subject: Re: [Linux-cachefs] [PATCH v4 0/5] netfs, 9p, afs,
 ceph: Support folios, at least partially
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-11-09 at 21:27 +0000, David Howells wrote:
> Here's a set of patches to convert netfs, 9p and afs to use folios and to
> provide sufficient conversion for ceph that it can continue to use the
> netfs library.  Jeff Layton is working on fully converting ceph.
> 
> This has been rebased on to the 9p merge in Linus's tree[5] so that it has
> access to both the 9p conversion to fscache and folios.
> 
> Changes
> =======
> ver #4:
>  - Detached and sent the afs symlink split patch separately.
>  - Handed the 9p netfslibisation patch off to Dominique Martinet.
>  - Added a patch to foliate page_endio().
>  - Fixed a bug in afs_redirty_page() whereby it didn't set the next page
>    index in the loop and returned too early.
>  - Simplified a check in v9fs_vfs_write_folio_locked()[4].
>  - Undid a change to afs_symlink_readpage()[4].
>  - Used offset_in_folio() in afs_write_end()[4].
>  - Rebased on 9p-folio merge upstream[5].
> 
> ver #3:
>  - Rebased on upstream as folios have been pulled.
>  - Imported a patch to convert 9p to netfslib from my
>    fscache-remove-old-api branch[3].
>  - Foliated netfslib.
> 
> ver #2:
>  - Reorder the patches to put both non-folio afs patches to the front.
>  - Use page_offset() rather than manual calculation[1].
>  - Fix folio_inode() to directly access the inode[2].
> 
> David
> 
> Link: https://lore.kernel.org/r/YST/0e92OdSH0zjg@casper.infradead.org/ [1]
> Link: https://lore.kernel.org/r/YST8OcVNy02Rivbm@casper.infradead.org/ [2]
> Link: https://lore.kernel.org/r/163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk/ [3]
> Link: https://lore.kernel.org/r/YYKa3bfQZxK5/wDN@casper.infradead.org/ [4]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f89ce84bc33330607a782e47a8b19406ed109b15 [5]
> Link: https://lore.kernel.org/r/2408234.1628687271@warthog.procyon.org.uk/ # v0
> Link: https://lore.kernel.org/r/162981147473.1901565.1455657509200944265.stgit@warthog.procyon.org.uk/ # v1
> Link: https://lore.kernel.org/r/163005740700.2472992.12365214290752300378.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>/ # v3
> ---
> David Howells (5):
>       folio: Add a function to change the private data attached to a folio
>       folio: Add a function to get the host inode for a folio
>       folio: Add replacements for page_endio()
>       netfs, 9p, afs, ceph: Use folios
>       afs: Use folios in directory handling
> 
> 
>  fs/9p/vfs_addr.c           |  83 +++++----
>  fs/9p/vfs_file.c           |  20 +--
>  fs/afs/dir.c               | 229 ++++++++++--------------
>  fs/afs/dir_edit.c          | 154 ++++++++--------
>  fs/afs/file.c              |  68 ++++----
>  fs/afs/internal.h          |  46 ++---
>  fs/afs/write.c             | 347 ++++++++++++++++++-------------------
>  fs/ceph/addr.c             |  80 +++++----
>  fs/netfs/read_helper.c     | 165 +++++++++---------
>  include/linux/netfs.h      |  12 +-
>  include/linux/pagemap.h    |  23 ++-
>  include/trace/events/afs.h |  21 +--
>  mm/filemap.c               |  64 ++++---
>  mm/page-writeback.c        |   2 +-
>  14 files changed, 666 insertions(+), 648 deletions(-)
> 
> 
> 
> Tested-by: Jeff Layton <jlayton@kernel.org>
> Tested-by: Dominique Martinet <asmadeus@codewreck.org>
> Tested-by: kafs-testing@auristor.com
> 

I know this already has my Tested-by, but I ran some more tests with
this series yesterday and it did fine:

(Re-)Tested-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

