Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE413556D8
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 16:42:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-zB-1VTIvNuWqcIfII1_4tA-1; Tue, 06 Apr 2021 10:42:14 -0400
X-MC-Unique: zB-1VTIvNuWqcIfII1_4tA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 818211800D50;
	Tue,  6 Apr 2021 14:42:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CD895D6DC;
	Tue,  6 Apr 2021 14:42:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2CC64A7C9;
	Tue,  6 Apr 2021 14:42:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136Eg96a017955 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 10:42:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47E7C112CA23; Tue,  6 Apr 2021 14:42:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42956112CA20
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 14:42:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13B4E805F47
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 14:42:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-430-cIZl2_ygPyKxFpKDcwa2HA-1; Tue, 06 Apr 2021 10:42:03 -0400
X-MC-Unique: cIZl2_ygPyKxFpKDcwa2HA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lTmsQ-00Cx9o-RR; Tue, 06 Apr 2021 14:40:27 +0000
Date: Tue, 6 Apr 2021 15:40:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20210406144022.GR2531743@casper.infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-2-willy@infradead.org>
	<20210406122918.h5dsnbjhmwpfasf4@box.shutemov.name>
	<20210406124807.GO2531743@casper.infradead.org>
	<20210406143150.GA3082513@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210406143150.GA3082513@infradead.org>
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, "Kirill A. Shutemov" <kirill@shutemov.name>,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 01/27] mm: Introduce struct folio
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

On Tue, Apr 06, 2021 at 03:31:50PM +0100, Christoph Hellwig wrote:
> > > As Christoph, I'm not a fan of this :/
> > 
> > What would you prefer?
> 
> Looking at your full folio series on git.infradead.org, there are a
> total of 12 references to non-page members of struct folio, assuming
> my crude grep that expects a folio to be named folio did not miss any.

Hmm ... I count more in the filesystems:

fs/afs/dir.c:   struct afs_vnode *dvnode = AFS_FS_I(folio->page.mapping->host);
fs/afs/dir.c:   _enter("{%lu},%zu,%zu", folio->page.index, offset, length);
fs/afs/file.c:  _enter("{%lu},%zu,%zu", folio->page.index, offset, length);
fs/afs/write.c:         folio->page.index);
fs/befs/linuxvfs.c:     struct inode *inode = folio->page.mapping->host;
fs/btrfs/disk-io.c:     tree = &BTRFS_I(folio->page.mapping->host)->io_tree;
fs/btrfs/disk-io.c:             btrfs_warn(BTRFS_I(folio->page.mapping->host)->root->fs_info,
fs/btrfs/extent_io.c:   struct btrfs_inode *inode = BTRFS_I(folios[0]->page.mapping->host);
fs/btrfs/file.c:                if (folio->page.mapping != inode->i_mapping) {
fs/btrfs/free-space-cache.c:                    if (folio->page.mapping != inode->i_mapping) {
fs/btrfs/inode.c:               if (folio->page.mapping != mapping) {
fs/btrfs/inode.c:       struct btrfs_inode *inode = BTRFS_I(folio->page.mapping->host);
fs/buffer.c:    spin_lock(&folio->page.mapping->private_lock);
fs/buffer.c:    spin_unlock(&folio->page.mapping->private_lock);
fs/buffer.c:    block_in_file = (sector_t)folio->page.index <<
fs/ceph/addr.c:              mapping->host, folio, folio->page.index);
fs/ceph/addr.c:      mapping->host, folio, folio->page.index,
fs/ceph/addr.c: folio->page.private = (unsigned long)snapc;
fs/ceph/addr.c: inode = folio->page.mapping->host;
fs/ceph/addr.c:              inode, folio, folio->page.index, offset, length);
fs/ceph/addr.c:      inode, folio, folio->page.index);
fs/cifs/file.c: struct cifsInodeInfo *cifsi = CIFS_I(folio->page.mapping->host);
fs/ext4/inode.c:        struct inode *inode = folio->page.mapping->host;
fs/f2fs/data.c: struct inode *inode = folio->page.mapping->host;
fs/fuse/dir.c:  int err = fuse_readlink_page(folio->page.mapping->host, &folio->page);
fs/gfs2/aops.c: struct gfs2_sbd *sdp = GFS2_SB(folio->page.mapping->host);
fs/iomap/buffered-io.c: unsigned int nr_blocks = i_blocks_per_folio(folio->page.mapping->host,
fs/iomap/buffered-io.c: struct inode *inode = folio->page.mapping->host;
fs/iomap/buffered-io.c: BUG_ON(folio->page.index);
fs/iomap/buffered-io.c:         gfp_t gfp = mapping_gfp_constraint(folio->page.mapping,
fs/iomap/buffered-io.c: struct inode *inode = folio->page.mapping->host;
fs/iomap/buffered-io.c: struct inode *inode = folio->page.mapping->host;
fs/iomap/buffered-io.c: trace_iomap_releasepage(folio->page.mapping->host, folio_offset(folio),
fs/iomap/buffered-io.c: trace_iomap_invalidatepage(folio->page.mapping->host, offset, len);
fs/jffs2/file.c:        struct inode *inode = folio->page.mapping->host;
fs/mpage.c:     struct inode *inode = folio->page.mapping->host;
fs/mpage.c:             gfp = readahead_gfp_mask(folio->page.mapping);
fs/mpage.c:             gfp = mapping_gfp_constraint(folio->page.mapping, GFP_KERNEL);
fs/mpage.c:     block_in_file = (sector_t)folio->page.index << (PAGE_SHIFT - blkbits);
fs/mpage.c:             prefetchw(&folio->page.flags);
fs/nfs/file.c:  nfs_fscache_invalidate_page(&folio->page, folio->page.mapping->host);
fs/nfs/fscache.c:                nfs_i_fscache(inode), folio, folio->page.index,
fs/nfs/fscache.c:                folio->page.flags, inode);
fs/reiserfs/inode.c:    struct inode *inode = folio->page.mapping->host;
fs/remap_range.c:       if (folio1->page.index > folio2->page.index)
fs/ubifs/file.c:        struct inode *inode = folio->page.mapping->host;
fs/xfs/xfs_aops.c:      struct inode            *inode = folio->page.mapping->host;

(I didn't go through my whole series and do the conversion from
folio->page.x to folio->x yet)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

