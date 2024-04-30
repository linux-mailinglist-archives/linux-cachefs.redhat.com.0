Return-Path: <linux-cachefs+bncBDLIXLMFVAERBIXTYOYQMGQEES7PSBY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mail.lfdr.de (Postfix) with ESMTPS id A65618B77C3
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:08 +0200 (CEST)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-36c55364cfdsf11903605ab.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485667; cv=pass;
        d=google.com; s=arc-20160816;
        b=ozvYwuqARfa7sQiu+33dTEdCFmxf6Ug9m8u0t23iCDZ9MVgEDLi9wpnqh6Dm03fujU
         rVlr+OLY075d5wlCMhLdk8fEywYUYdrfEXErxXCKT7h9of/nGZIuBQaPcKOXetcBueCO
         QsxUj2quczDHBfiT12PW0xG9lFLDh0qedIVnWBnUSVHf33OyAysz7Ss7YmraxlHuE+Cf
         PbGtxbdrSp+8R9X7hN2C7Dv7RbU8HJSnonMHOZ/5V0E42Ew3TrU4zC9zmj5gjcSNxbDA
         yJ2vYp9TXKA+TgcSOrTC/SwV8jsq/tSGJYXgEaXCrzQacrWeFERqSXtZeWJfDzIzFmoJ
         9gBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=mOmxhwarWPBpkAds1PUDmIfx30hsjJsXFBpMLS0KLRc=;
        fh=MLlkbdCzOfoOZAGzswJPXtt6e+R8AA59XREiTVNWxIA=;
        b=I2O4npKBTju+FSbawero0ux/91MFqAkiq+7mz3EGUz7PNNM7IulCqAlsmnbPJCaRFa
         veyjKgeo7TYj8dPp5P7D6vaSFK7bWt2NLIHY9R6+FAav384NUoC74MDrTnCv7gatmUH3
         HhAYaLJEVX/BxXXkCPfsPPveDOdM2yp3S1a2jmUzQM470CzA1cmRRU8ho0/hicR4OjTM
         47f+ubxMQrZlm9flueC8pAjCBEbwRclZXkDwnZePRSvtpAJRID9Ik8tZLYUmkzgKRWN+
         duVlVmUfAoaHkBcTe73lqWbdx3JA9ODLh9aXgL0k+RXxYGJydXXYDPx+djw9G1BIAlv1
         6aBA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485667; x=1715090467;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOmxhwarWPBpkAds1PUDmIfx30hsjJsXFBpMLS0KLRc=;
        b=SfVHKXKHrON6PDLfkvLDyPzv/PqsbX1nO8wTtIFy6NGXpGIqORSCL8tqtPMdOJUdyY
         0wFIUFdD8yR1/RRF6fHmsDgluhTeM8MI0CiUTHd9s1yWkLyU3jvnwMNcmLRbk5MtEo7m
         VHgPDwwOboFpUcU1WeuuqsqJm6l7+sHFS8xJoEoYYUg4p/UFrTkw72Bcosmn0fpOUifb
         ttd270EtCoTHaQh9PtXhov4xLJgfP/iVITpktaldRTzA/NmBoyrxTMIhbxqNuWK2t5j7
         WS/9/Nb8FNEY9wIDvkZOvXbhhKP0h6XGtU5SYCvoZCLPS+UtfEyOqs8MkgG0NqWBakpZ
         fsag==
X-Forwarded-Encrypted: i=2; AJvYcCXnlVZTUo/y7OdGciaUYwIm+i2+Li6CW7l1+WPqh+yiGZk3qcn5iFkMpOk6pu6bWjcQJGR/eneHYMcIZo9sRrHmAL2IhNyQpy85/mM=
X-Gm-Message-State: AOJu0YzAn9pypMTKpiyZC3XlKsMoNvBfUmuN8jOlTTCk3+vhJQYsJ5/M
	ZzmSjtMq4Qc5mFa/v6OGJjr0hJt3celVYktiLMs2KjUs/4TnygjZpXfsaUbjoDA=
X-Google-Smtp-Source: AGHT+IHfqX5W3j8gBFcDUk2zseFOcw98FFQyY/Cor5SC2DYdd6HiCp2uMFKk8RH/me/7SHU5wmX1ZA==
X-Received: by 2002:a05:6e02:214c:b0:36c:c9f:ccd0 with SMTP id d12-20020a056e02214c00b0036c0c9fccd0mr16722162ilv.17.1714485666821;
        Tue, 30 Apr 2024 07:01:06 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6e02:16cf:b0:36b:707:785b with SMTP id
 e9e14a558f8ab-36c29d878b4ls9089675ab.0.-pod-prod-09-us; Tue, 30 Apr 2024
 07:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXj7a81W28ZO0XRryIDPGTkcVu5jABVSNYxXd5UYYFISMrBHxbk84Raj89DgxtdUh6ZWLrcYP+3mUV/SMHgLmk7jhASF1i0WOGDzZNNOok=
X-Received: by 2002:a6b:6a18:0:b0:7de:c308:76e5 with SMTP id x24-20020a6b6a18000000b007dec30876e5mr8673629iog.0.1714485665682;
        Tue, 30 Apr 2024 07:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485665; cv=none;
        d=google.com; s=arc-20160816;
        b=WtYTX44JQL7UEKlETT+ZU3Nr5I5AAt9x03iCsj/ifgBOPWCslfzPLPy7Ob4ShyuDCO
         rVMFbGlXUJYW9BHxXGSSnyk4cF29cooH/WgEWMcj/c59b8cAZ/8fd0TPgSv9dj8fyoWS
         C0ROe8dvP4DxUqjzfJcFjKhv+Ukjh1L7OUauB0blD/EdppI89+6lObkKpGttFKIpPciG
         ohTut0aqKPbkr36VOQySHYUdZNKFe56SN4FVqJ+rYkp0ENeJoiyMXPYt4dR58Whh9osK
         X+iA5tySPiUYWsGyVhWwjuFx+3s/WYQNMFn/y8Rl8XXjD8g/AAGoI0r0mDN2tRuv6dy5
         LRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=K3Irydl6Xh7jL+cMJWxpcSfsWrNZFzC5/LPeqTp0XrU=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=dmW/C1xWoiaeDy4xOu9KkaX3RosMDPSGqC0ujsvi2hVJfsGyYGmCPMJCdAaSM/moRJ
         eH+ZukUXoQ2xngPixOc059OzCHTgYbSVwccY1zmndAOzxjV8drUW0kXso/GbBwEeRC5r
         09BRE/MgXu7ZkFhB7tew981NnC3mhL43wngOslzlGIB9C2gykAgkR4Ok/h3m4hSTb53t
         ZI8mnRWkvzT0VXt7+IIBmpia+oYkjvgmxz1P30JuFx9v9A0SOJE+hYMGxjbgKFoR44xw
         ILoNzz3bX90gR/YuHOa3opsH7OkdV3iqIhHXJOrpxiEoP9k8Akinwumd42klx45MGkat
         w4+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fm10-20020a0566020b8a00b007ded496c681si1237464iob.56.2024.04.30.07.01.05
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-NciZ1rPzMROzmUOehdb8Hw-1; Tue, 30 Apr 2024 10:01:03 -0400
X-MC-Unique: NciZ1rPzMROzmUOehdb8Hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F0D481F448
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0BA6D400D68B; Tue, 30 Apr 2024 14:01:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D94C40C140B;
	Tue, 30 Apr 2024 14:00:59 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/22] netfs, afs, 9p, cifs: Rework netfs to use ->writepages() to copy to cache
Date: Tue, 30 Apr 2024 15:00:31 +0100
Message-ID: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Hi Christian, Willy,

Here's an updated version of my netfs writeback rewrite.  There haven't
been any major fixes.  So far...

The primary purpose of these patches is to rework the netfslib writeback
implementation such that pages read from the cache are written to the cache
through ->writepages(), thereby allowing the fscache page flag to be
retired.

The reworking also:

 (1) builds on top of the new writeback_iter() infrastructure;

 (2) makes it possible to use vectored write RPCs as discontiguous streams
     of pages can be accommodated;

 (3) makes it easier to do simultaneous content crypto and stream division.

 (4) provides support for retrying writes and re-dividing a stream;

 (5) replaces the ->launder_folio() op, so that ->writepages() is used
     instead;

 (6) uses mempools to allocate the netfs_io_request and netfs_io_subrequest
     structs to avoid allocation failure in the writeback path.

Some code that uses the fscache page flag is retained for compatibility
purposes with nfs and ceph.  The code is switched to using the synonymous
private_2 label instead and marked with deprecation comments.  I have a
separate set of patches that convert cifs to use this code.

-~-

In this new implementation, writeback_iter() is used to pump folios,
progressively creating two parallel, but separate streams.  Either or both
streams can contain gaps, and the subrequests in each stream can be of
variable size, don't need to align with each other and don't need to align
with the folios.  (Note that more streams can be added if we have multiple
servers to duplicate data to).

Indeed, subrequests can cross folio boundaries, may cover several folios or
a folio may be spanned by multiple subrequests, e.g.:

         +---+---+-----+-----+---+----------+
Folios:  |   |   |     |     |   |          |
         +---+---+-----+-----+---+----------+

           +------+------+     +----+----+
Upload:    |      |      |.....|    |    |
           +------+------+     +----+----+

         +------+------+------+------+------+
Cache:   |      |      |      |      |      |
         +------+------+------+------+------+

Data that got read from the server that needs copying to the cache is
stored in folios that are marked dirty and have folio->private set to a
special value.

The progressive subrequest construction permits the algorithm to be
preparing both the next upload to the server and the next write to the
cache whilst the previous ones are already in progress.  Throttling can be
applied to control the rate of production of subrequests - and, in any
case, we probably want to write them to the server in ascending order,
particularly if the file will be extended.

Content crypto can also be prepared at the same time as the subrequests and
run asynchronously, with the prepped requests being stalled until the
crypto catches up with them.  This might also be useful for transport
crypto, but that happens at a lower layer, so probably would be harder to
pull off.

The algorithm is split into three parts:

 (1) The issuer.  This walks through the data, packaging it up, encrypting
     it and creating subrequests.  The part of this that generates
     subrequests only deals with file positions and spans and so is usable
     for DIO/unbuffered writes as well as buffered writes.

 (2) The collector.  This asynchronously collects completed subrequests,
     unlocks folios, frees crypto buffers and performs any retries.  This
     runs in a work queue so that the issuer can return to the caller for
     writeback (so that the VM can have its kswapd thread back) or async
     writes.

     Collection is slightly complex as the collector has to work out where
     discontiguities happen in the folio list so that it doesn't try and
     collect folios that weren't included in the write out.

 (3) The retryer.  This pauses the issuer, waits for all outstanding
     subrequests to complete and then goes through the failed subrequests
     to reissue them.  This may involve reprepping them (with cifs, the
     credits must be renegotiated and a subrequest may need splitting), and
     doing RMW for content crypto if there's a conflicting change on the
     server.

The patches can be found here also:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=netfs-writeback

David

Link: https://lore.kernel.org/r/20240328163424.2781320-1-dhowells@redhat.com/ # v1

Changes
=======
ver #2)
 - Rebase on v6.9-rc6 to accommodate some fixes that went upstream.
 - Make netfs_begin_writethrough() actually return an error.
 - Move the cifs invalidation patch to the cifs-netfs branch.
 - Mark writeback_iter() EXPORT_SYMBOL_GPL.
 - In p9_client_write_subreq(), use 'int len' rather than 'size_t len'
   because of the varargs packet formatter.
 - In netfs_perform_write(), don't wait for writeback if we don't need to.
 - Don't do the AFS StoreData RPC inline, but keep doing it from a
   workqueue.
 - Remove a couple of redundant checks where the second used to be inside
   a lock.
 - Add missing linux/bio.h for BIO_MAX_VECS in cachefiles.
 - Change a comma ending a statement to a semicolon.
 - Make filemap_invalidate_inode() take a range.
 - Make netfs_unbuffered_write_iter() use filemap_invalidate_inode().

David Howells (22):
  netfs: Update i_blocks when write committed to pagecache
  netfs: Replace PG_fscache by setting folio->private and marking dirty
  mm: Remove the PG_fscache alias for PG_private_2
  netfs: Remove deprecated use of PG_private_2 as a second writeback
    flag
  netfs: Make netfs_io_request::subreq_counter an atomic_t
  netfs: Use subreq_counter to allocate subreq debug_index values
  mm: Provide a means of invalidation without using launder_folio
  9p: Use alternative invalidation to using launder_folio
  afs: Use alternative invalidation to using launder_folio
  netfs: Remove ->launder_folio() support
  netfs: Use mempools for allocating requests and subrequests
  mm: Export writeback_iter()
  netfs: Switch to using unsigned long long rather than loff_t
  netfs: New writeback implementation
  netfs: Add some write-side stats and clean up some stat names
  netfs, afs: Implement helpers for new write code
  netfs, 9p: Implement helpers for new write code
  netfs, cachefiles: Implement helpers for new write code
  netfs: Cut over to using new writeback code
  netfs: Remove the old writeback code
  netfs: Miscellaneous tidy ups
  netfs, afs: Use writeback retry to deal with alternate keys

 fs/9p/vfs_addr.c             |  60 +--
 fs/afs/file.c                |   8 +-
 fs/afs/internal.h            |   6 +-
 fs/afs/validation.c          |   4 +-
 fs/afs/write.c               | 189 ++++----
 fs/cachefiles/io.c           |  76 +++-
 fs/ceph/addr.c               |  24 +-
 fs/ceph/inode.c              |   2 +
 fs/netfs/Makefile            |   3 +-
 fs/netfs/buffered_read.c     |  40 +-
 fs/netfs/buffered_write.c    | 825 +++--------------------------------
 fs/netfs/direct_write.c      |  56 ++-
 fs/netfs/fscache_io.c        |  14 +-
 fs/netfs/internal.h          |  55 ++-
 fs/netfs/io.c                | 155 +------
 fs/netfs/main.c              |  55 ++-
 fs/netfs/misc.c              |  10 +-
 fs/netfs/objects.c           |  81 +++-
 fs/netfs/output.c            | 478 --------------------
 fs/netfs/stats.c             |  17 +-
 fs/netfs/write_collect.c     | 808 ++++++++++++++++++++++++++++++++++
 fs/netfs/write_issue.c       | 675 ++++++++++++++++++++++++++++
 fs/nfs/file.c                |   8 +-
 fs/nfs/fscache.h             |   6 +-
 fs/nfs/write.c               |   4 +-
 fs/smb/client/file.c         |  16 +-
 include/linux/fscache.h      |  22 +-
 include/linux/netfs.h        | 196 +++++----
 include/linux/pagemap.h      |   2 +
 include/net/9p/client.h      |   2 +
 include/trace/events/netfs.h | 249 ++++++++++-
 mm/filemap.c                 |  60 ++-
 mm/page-writeback.c          |   1 +
 net/9p/Kconfig               |   1 +
 net/9p/client.c              |  49 +++
 35 files changed, 2502 insertions(+), 1755 deletions(-)
 delete mode 100644 fs/netfs/output.c
 create mode 100644 fs/netfs/write_collect.c
 create mode 100644 fs/netfs/write_issue.c

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

