Return-Path: <linux-cachefs+bncBDLIXLMFVAERBPFB46VQMGQESM25MRY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C59811790
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:41:49 +0100 (CET)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1faeac8b074sf14184166fac.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:41:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482108; cv=pass;
        d=google.com; s=arc-20160816;
        b=0j2JwSRYWGlkWTzrAOZw/LC671FAXKXfKF6PFJJauZ5TiF3Xnz3lTwsgOWoVDgcIS1
         8xUWlGHQIv4RDKwInfhEQnD704XLqBk1M2j//8S/spBYLJjh+QkZgCqcq4BO//BMhcp+
         8bZ0zqn2GaG9Q5v4OlBjGVmglEgOo3CwmEgTnrkHd6MW7G5cLP3DMUk8Axa0fpyf1h+7
         tVimXLL04O310WuQeMV1s1+72IcXVou+WCZogTI4008AHDSQHSevaP4t5DasXyenjHbd
         uORvxBG0lIp9TfO2fPxf7M2soueF3VDvF1L8XAb/kJgXOQmcwOtjnclgdY5M2WPC+H9V
         qo7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=8TL7Pb9rIXlxH7vDyfuAJX3qL5i5Z1gpiYU4tEST8pM=;
        fh=ee1YPdrJuYGKrg3MRTp+q3cjybCO3+kPj0hBIW9th3I=;
        b=fmzae8/qCxrd+/wor40Kr3WBa+yD52n+imSTS1R3mJRcllMZ/fzjKFe+5eDMe0JIxs
         fYDH94C4ZsuX8Wn9QZFv2uacLu3mwgxO+I/O0W3RFjZtrNvguFtaaTQIDR/3A6aLCpeA
         nV3TwYSBDCnXOLOuZvaPbqDw6vy7QsWGV+18UjBKcHXP0Z1zYozh/0RCgAcx9nG0Z2LE
         noBeB7r/rEMe5LyXKNneNrWWjRj84OyftL6NJAa7l1NyLK2IXvNs7p2o/S4x9EKJ8/Ar
         ls6t90JzfAIb9cPEKJB5QgAuRjiUmuXYdJNQrK2Aohs7c7yDXKbQQXZI17w3c8LXrxJq
         APuw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482108; x=1703086908;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TL7Pb9rIXlxH7vDyfuAJX3qL5i5Z1gpiYU4tEST8pM=;
        b=qRQNEhqG9DYuGa3vFvsMli8nUckepwj067b4eOgMU69+sTtyBwqjGQt8wygcpoLxSe
         Q+aZ23FcuyDNRJnHs7X6xdb1TgOYOhl1awL/BZlmugat6DndQSnQa9FAvIlJVBMBkeA4
         tQIApgTanLEzzSNbZlcOrzLV0LsUbPPviTrRyrHYXZs8nbIFHkump/pqXSdb5qLq5OHo
         nKqd8KObOscx+fvJJyRmMqiHQuiAM5e6B8NZvet9ZcHYVk8VCnXQLfhd+clztM0zbawP
         tuJSp/1Ygsjs5aQTaJSd1lqfFjMUMov1ZbSwU1nUaUsc8CMe9Vusw0MSyeyAMB8Pj+OC
         KtXA==
X-Gm-Message-State: AOJu0YwJlzEe3JkpxqRDlflG7jxfRniO2gpeo83r1eexVsj5Ng6zABqh
	0TgdHW4bFAUEDi4PWNlmiKXUAQ==
X-Google-Smtp-Source: AGHT+IGHhAgLh7fH/4mYI/56yTmwVn3sE76KCfBc6/XCL+NSo4/7mRAYOP9dm6d+S4R2y6SiSwtBjQ==
X-Received: by 2002:a05:6870:4612:b0:202:ffc8:c6b8 with SMTP id z18-20020a056870461200b00202ffc8c6b8mr3152585oao.1.1702482108424;
        Wed, 13 Dec 2023 07:41:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:4b88:b0:679:fa52:346a with SMTP id
 qf8-20020a0562144b8800b00679fa52346als816567qvb.0.-pod-prod-09-us; Wed, 13
 Dec 2023 07:41:48 -0800 (PST)
X-Received: by 2002:a0c:fd83:0:b0:67e:ffdb:caeb with SMTP id p3-20020a0cfd83000000b0067effdbcaebmr534076qvr.37.1702482107829;
        Wed, 13 Dec 2023 07:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482107; cv=none;
        d=google.com; s=arc-20160816;
        b=MDGZv7NTuxAQvgDrhs/aHTP9/JJ9JPfjvYYZE21qhdUgyxtlM4srDmkhJFcZbO56FY
         OgEszbOVeVKPA9luJntrXTLpsDhJdKHB6lKkTVwQuoImKrtnTEN0FR5imb7LxrKARuDG
         SIFgwC0c7L4Ah5hoGpXlvEVfj/JCPYfdRBreWyMCkHjgJ5Ck+/jEI9V89N9yafD6kdla
         qb5XuD7F0Q8YrIYJXlP4IWrnoBKjpl4ayd/l7NmMPE3vHC2EXqlLjx++Y9JXzmeAXL8p
         CYcc4VEtEt/sD/r7HFurn4Ewrnl93R2Kiy9n1iEzyCIORsIohFrKxCyJcrXQTI5tpewu
         c7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=2oFktIEULbAkj5jUdPt4Q3ozrAu4q3Ve4X5/zahl/is=;
        fh=ee1YPdrJuYGKrg3MRTp+q3cjybCO3+kPj0hBIW9th3I=;
        b=nCfJMQUEvbSG9xsWdbEO4XfX2uq8gLcMdw6hLIT+ikyzTUPJKOUOph9nLPywl4JyQq
         tXpV3Y/iZ49zkLJMsck1XwQYWA7qi6TfL7JWbBFwj0/THLIulQ4MB6ZkGPE8qzrX9bYx
         TUf8R/u2S2n8iewKNb0Jffh4bqJ5wOhmedACmRTvKKqgq3UauMp1Wk5BlFqot1VoVDT7
         WB60bqOltrpPCudfYxDdhW1mJjeHZZO69yAygdpmjmEkUe8IQxQvKOVe4FwAUxdVPLpQ
         iz3O6nLBy8gCq79dSGMuM+y0oI3gh3ltaxp90zYAFMfwmZh5CgAezdgSrOiRhsXGooFI
         vLfg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c11-20020a0cfb0b000000b0067ef6aade03si1681314qvp.164.2023.12.13.07.41.47
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:41:47 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-S8uRSTQcMKGYKGqrcQZ39w-1; Wed, 13 Dec 2023 10:41:46 -0500
X-MC-Unique: S8uRSTQcMKGYKGqrcQZ39w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8A768350EE
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:41:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D535AC15E6A; Wed, 13 Dec 2023 15:41:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BC0EC15968;
	Wed, 13 Dec 2023 15:41:43 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/13] netfs, cifs: Delegate high-level I/O to netfslib
Date: Wed, 13 Dec 2023 15:41:26 +0000
Message-ID: <20231213154139.432922-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Hi Steve,

Here are patches to convert cifs to use my netfslib helpers.  With this I can
run a certain amount of xfstests on CIFS, though I'm running into occasional
ksmbd issues and not all the tests work correctly because of fallocate issues.

The patches remove around 2000 lines from CIFS

This stacks on top of my netfs-lib branch[1].

CIFS notes:

 (1) CIFS is made to use unbuffered I/O for unbuffered caching modes and
     write-through caching for cache=strict.

 (2) Various cifs fallocate() function implementations needed fixing and
     those fixes are upstream or on the way.

 (3) It should be possible to turn on multipage folio support in CIFS now.

 (4) The then-unused CIFS code is removed in three patches, not one, to
     avoid the git patch generator from producing confusing patches in
     which it thinks code is being moved around rather than just being
     removed.

The patches can be found here also:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=cifs-netfs

Changes
=======
ver #4)
 - Slimmed down the branch:
   - Split the cifs-related patches off to a separate branch (cifs-netfs)
   - Deferred the content-encryption to the in-progress ceph changes.
   - Deferred the use-PG_writeback rather than PG_fscache patch
 - Rebased on a later linux-next with afs-rotation patches.

ver #3)
 - Moved the fscache module into netfslib to avoid export cycles.
 - Fixed a bunch of bugs.
 - Got CIFS to pass as much of xfstests as possible.
 - Added a patch to make 9P use all the helpers.
 - Added a patch to stop using PG_fscache, but rather dirty pages on
   reading and have writepages write to the cache.

ver #2)
 - Folded the addition of NETFS_RREQ_NONBLOCK/BLOCKED into first patch that
   uses them.
 - Folded addition of rsize member into first user.
 - Don't set rsize in ceph (yet) and set it in kafs to 256KiB.  cifs sets
   it dynamically.
 - Moved direct_bv next to direct_bv_count in struct netfs_io_request and
   labelled it with a __counted_by().
 - Passed flags into netfs_xa_store_and_mark() rather than two bools.
 - Removed netfs_set_up_buffer() as it wasn't used.

David

Link: https://lore.kernel.org/r/20231213152350.431591-1-dhowells@redhat.com/ [1]
Link: https://lore.kernel.org/r/20231013160423.2218093-1-dhowells@redhat.com/ # v1
Link: https://lore.kernel.org/r/20231117211544.1740466-1-dhowells@redhat.com/ # v2
Link: https://lore.kernel.org/r/20231207212206.1379128-1-dhowells@redhat.com/ # v3

David Howells (13):
  netfs: Rearrange netfs_io_subrequest to put request pointer first
  cifs: Replace cifs_readdata with a wrapper around netfs_io_subrequest
  cifs: Share server EOF pos with netfslib
  cifs: Set zero_point in the copy_file_range() and remap_file_range()
  cifs: Replace cifs_writedata with a wrapper around netfs_io_subrequest
  cifs: Use more fields from netfs_io_subrequest
  cifs: Make wait_mtu_credits take size_t args
  cifs: Implement netfslib hooks
  cifs: Move cifs_loose_read_iter() and cifs_file_write_iter() to file.c
  cifs: Cut over to using netfslib
  cifs: Remove some code that's no longer used, part 1
  cifs: Remove some code that's no longer used, part 2
  cifs: Remove some code that's no longer used, part 3

 fs/netfs/buffered_write.c    |    3 +
 fs/netfs/io.c                |    7 +-
 fs/smb/client/Kconfig        |    1 +
 fs/smb/client/cifsfs.c       |   86 +-
 fs/smb/client/cifsfs.h       |   10 +-
 fs/smb/client/cifsglob.h     |   59 +-
 fs/smb/client/cifsproto.h    |   14 +-
 fs/smb/client/cifssmb.c      |  111 +-
 fs/smb/client/file.c         | 2908 ++++++----------------------------
 fs/smb/client/fscache.c      |  109 --
 fs/smb/client/fscache.h      |   54 -
 fs/smb/client/inode.c        |   27 +-
 fs/smb/client/smb2ops.c      |   28 +-
 fs/smb/client/smb2pdu.c      |  168 +-
 fs/smb/client/smb2proto.h    |    5 +-
 fs/smb/client/trace.h        |  144 +-
 fs/smb/client/transport.c    |   17 +-
 include/linux/netfs.h        |    3 +-
 include/trace/events/netfs.h |    1 +
 19 files changed, 883 insertions(+), 2872 deletions(-)

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

