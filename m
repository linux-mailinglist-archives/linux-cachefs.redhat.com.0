Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63944C48E
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Nov 2021 16:39:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-mGP1mzlgMfmEFHPD6Dw0PQ-1; Wed, 10 Nov 2021 10:39:07 -0500
X-MC-Unique: mGP1mzlgMfmEFHPD6Dw0PQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FEE4804141;
	Wed, 10 Nov 2021 15:39:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B1DF56A8C;
	Wed, 10 Nov 2021 15:39:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 589D71832DDB;
	Wed, 10 Nov 2021 15:39:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AAFIptn007860 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 10:18:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AC9F12026D5D; Wed, 10 Nov 2021 15:18:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C922026D48
	for <linux-cachefs@redhat.com>; Wed, 10 Nov 2021 15:18:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEE8480015A
	for <linux-cachefs@redhat.com>; Wed, 10 Nov 2021 15:18:48 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-323-_tEs3uyeOkiSAH06OsXpAw-1; Wed, 10 Nov 2021 10:18:47 -0500
X-MC-Unique: _tEs3uyeOkiSAH06OsXpAw-1
Received: by mail-ed1-f42.google.com with SMTP id x15so12080509edv.1;
	Wed, 10 Nov 2021 07:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mO3hph1YkCApcCuLSKx4NqEPJzPi9cWVsNMhXuQPk3w=;
	b=NW8YfjLVhhFyYtcJzIehCcQAPXg9JmUpG2ZOdS9NvY01VI3zNWyzlwB0XEmdWwSr26
	CotNlUvpZ2JqCH7NshmzJCgR0e0t2VQ3fj8sNvyxBujG9W1kTixDBL5doMReru+lulVR
	qi8zRGlwthuap5D+toB72S3O3TjoOelrcNgHw+6E7Yq9s1RECVOI/kA+YnTj+yJ9E//5
	pQtGbY8/2rI8s3Gd897OEdE1jakDRDV5kiRWczLAY++/Xre+nnXnDGXy0IMCfYeLHC0R
	Rj+5juIqlM8l5YJfrmjbEC0Pvd/OfYqZjTAM8FiCu77DvSb9IkHjKgboIAcDPyvSrhj5
	StxQ==
X-Gm-Message-State: AOAM532mawn9Dzsz6OGDJ2T2DKOUQxuzHZ3tKFrmaMZixrm2S8/MYHng
	KrzzQF1Nv4KyarOCEb7PoPu5UIt3lqX3CY05
X-Google-Smtp-Source: ABdhPJwCS7BzoOYshp2Y1J6mJ+U7n8hSGny+2Jja2TJxIdOcZCaJrCt+15ZobN6lAJ4lclYIlNED0g==
X-Received: by 2002:a50:99c6:: with SMTP id n6mr340789edb.171.1636557525369;
	Wed, 10 Nov 2021 07:18:45 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
	[209.85.221.42])
	by smtp.gmail.com with ESMTPSA id nb17sm27785ejc.7.2021.11.10.07.18.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 10 Nov 2021 07:18:44 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id d27so4626996wrb.6;
	Wed, 10 Nov 2021 07:18:44 -0800 (PST)
X-Received: by 2002:a05:6000:4b:: with SMTP id k11mr627335wrx.86.1636557523979;
	Wed, 10 Nov 2021 07:18:43 -0800 (PST)
MIME-Version: 1.0
References: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
In-Reply-To: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
From: Marc Dionne <marc.dionne@auristor.com>
Date: Wed, 10 Nov 2021 11:18:32 -0400
X-Gmail-Original-Message-ID: <CAB9dFdvOM=QPGxNj1GpZkedd_kq9HWsc__MpUJevOGfSsNfopQ@mail.gmail.com>
Message-ID: <CAB9dFdvOM=QPGxNj1GpZkedd_kq9HWsc__MpUJevOGfSsNfopQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	kafs-testing@auristor.com, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 9, 2021 at 5:28 PM David Howells <dhowells@redhat.com> wrote:
>
>
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

The updated series passed our automated test suite, which is mostly
targeted afs testing, but with a framework that also relies on 9p.

So you can reapply:
Tested-by: kafs-testing@auristor.com

Marc

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

