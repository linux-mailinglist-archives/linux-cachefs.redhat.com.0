Return-Path: <linux-cachefs+bncBDLIXLMFVAERBCOY6SWAMGQE33QDQFQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B18284AB
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 12:20:42 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dde0d9a04bsf1097144a34.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 03:20:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704799241; cv=pass;
        d=google.com; s=arc-20160816;
        b=j8p4ExbUkOupmwShk5cRbVxvrokcoPHgHtKWTrHYOv0wt6iSCBY0GE7zCePyQHal37
         I1/wLRvRbNXtOJOYl+JhQSXrRfCwMfNOIyhRdHyPaKpgzsFqJVwRVgw72GaSKUtaDOv0
         QRQe6uIGpfOfoM4xDsqorCHS266BA3KpPVUKhyJVKEpZOqEFiB4QBGbwRhpMvYCZV+yi
         Zr5wCeytXeiEGu0kU0HKAh/A2tlXJyeJKQpn+KdbbQAK+h/g8QIcOVxd+3iyjRyb9v3n
         N346Ufp0r8HylyjFA8Y/1KsyeZrUGEdSpiBqXjlhIgEmMnzEe0Nqt4k0MK110W0rop1L
         sz9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=KQ3sV7R0/bJ1HUPtW0Di6ypQ7eYBKenKlw2bLAjCp3M=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=Gb+T8Kb+KG1FEx1VMg1M5cpYEXMXyfpLxiRwmT2tkE4XMN6iVHg+a3KMcByaVWIY0B
         QQpDsF/ZBI6YZ/kwcvaEAoiHxR/g3HKWQwY9mbS+q/o0e8Ejo9gP1H5QvdN4MgHgGwZm
         RFCupMljfYAj7mO7EV6t8M9kXjBzlXa5orsgUJdYaQ/MIJhnPdqiulbkB+1OfK3rJZp/
         rWpXDMsELNFouWYDlAUEbQEXp0pMFZJTvbZ/xMv2AMXPsEg646tIG4IM/9EkSo6/lIer
         UDi4dScm+nuFwe0G1ChJAKL+rbkx7FGJJ1g7NHnq+JfApRwoRKmI2iVHhVFqh+txV743
         3H2w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799241; x=1705404041;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQ3sV7R0/bJ1HUPtW0Di6ypQ7eYBKenKlw2bLAjCp3M=;
        b=SXT/wKASqSzwo5T3gfjt3f6wbGT4/i2tAC+7rGC/NoaEZ13LDQqB96p0mSbIJAM7iU
         rh2A41afOwGRa/hUsO6CNRg+2AE76CPSpDO6XC3ve8kH6O9GbKIJWytX8lZkPaVtfaMx
         V1zchx2krcN1NOI3maZxysIpSmp+3me5j/l14qeW1g4G0r5tf5eU4OvBidlD+Z9qSxlR
         2BXv+NDWfSFMsSAoavxMQMn5Y/WuSv5iyPxZajw4BNZyn2bBrDWsVnDDnEdOiwTnDC0P
         uNcNEcM+XUPX0EWWvd/Bgv5kaHRUXsn2yA9GF2zSBYOH7kOBRv7A+kFasu0jqs/6HoSR
         DzLA==
X-Gm-Message-State: AOJu0YxCqC+xGe/14XYgfMe2+bkCnJDfdoiU/1ws9whyTQVCWiylXOKH
	wP555VBqNUCF8ZNvh3gghUVo5l0F6xFKmQ==
X-Google-Smtp-Source: AGHT+IHo8XRbotL9FzPSkEKDvsmvtnRd8oqHR1r+5a/7xw67+bNlhZku/G7H8z6cGn6pXsM7sdh5Vg==
X-Received: by 2002:a05:6830:4413:b0:6dc:2e77:42c8 with SMTP id q19-20020a056830441300b006dc2e7742c8mr5084121otv.29.1704799241094;
        Tue, 09 Jan 2024 03:20:41 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:54c:b0:596:181e:ebc5 with SMTP id
 n12-20020a056820054c00b00596181eebc5ls2431098ooj.1.-pod-prod-05-us; Tue, 09
 Jan 2024 03:20:40 -0800 (PST)
X-Received: by 2002:a05:6808:4482:b0:3bc:2e9d:c923 with SMTP id eq2-20020a056808448200b003bc2e9dc923mr7906066oib.89.1704799240539;
        Tue, 09 Jan 2024 03:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704799240; cv=none;
        d=google.com; s=arc-20160816;
        b=ygWSkQ/i1k6w9L0fguMuTA1QZh4Ji1siaMJtez1CASH6OD7ZLw9o05VVFUWhcwabK6
         OwTAsnLfU4HSYgMZ8gZrOmU1oIdGICJipbV7l+hV03Mak5MuYZZ/gmFpqwS/e8tanVzi
         NiqaOlQ6xMDOC+rbzYe70aj0Ta/3rIRrYeWA6K2nm6bB70PkPZFuQCxaKrGkpAXFaEef
         fkei1w9ltCdlGlPDFh1vLF7oZAoydTYIlvTPHB4HRQilTlKm4MZ4hOobrTaYq4Z2MRdC
         ybYJ5PQHlWRCP3mR+buNeBGuUj8qRoL16dIgQqRbYLwCMxmz9v4HWg3r7BOhbwZlBUAD
         /iBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=Q1rVQCIFdSKutS/VkuEkTryFHcPbkDTWRo3T0LrhEQg=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=LoSixCU2rLq6pu3NBtCc6OfL6h9Ysg3GRKiHPjYmiVa21PLfOLedRRXr62lsGQ2FYv
         Q+rOx/OEXUexDFr66wrxy/68IDHU6piPxXW/OWesqLafRBUCoeahq+uwwnG6r3cFm1Y5
         R3VwujVW3KgeooaQ2Lal+JrPz5VH9gMO6Y6bRLWo+vFB9Px2t30vHUw5U5rKZXOZR+eO
         2wWmo9yWcUdj+DmE8mEg37BUafSIvL1HZBZr85VMiycvA1Q6LnRu/6lx9Rixl+XlrT0m
         wmPjumeHQbON318SWgCdA/Vo0AiHbYBmMsZ1SwEvD5jM1Mbb4XLwTGcWSbmZ7DaU4rhh
         BkNg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id o8-20020a05622a008800b004298cd99df9si1798311qtw.290.2024.01.09.03.20.40
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-XrD89wbwPrqjyG20ic-Sww-1; Tue, 09 Jan 2024 06:20:39 -0500
X-MC-Unique: XrD89wbwPrqjyG20ic-Sww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D653D82A6CB
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 11:20:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D235F5B7B; Tue,  9 Jan 2024 11:20:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6A5A51E3;
	Tue,  9 Jan 2024 11:20:35 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
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
Subject: [PATCH 0/6] netfs, cachefiles: More additional patches
Date: Tue,  9 Jan 2024 11:20:17 +0000
Message-ID: <20240109112029.1572463-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Hi Christian, Jeff, Gao,

Here are some additional patches for my netfs-lib tree:

 (1) Mark netfs_unbuffered_write_iter_locked() static as it's only used in
     the file in which it is defined.

 (2) Display a counter for DIO writes in /proc/fs/netfs/stats.

 (3) Fix the interaction between write-streaming (dirty data in
     non-uptodate pages) and the culling of a cache file trying to write
     that to the cache.

 (4) Fix the loop that unmarks folios after writing to the cache.  The
     xarray iterator only advances the index by 1, so if we unmarked a
     multipage folio and that got split before we advance to the next
     folio, we see a repeat of a fragment of the folio.

 (5) Fix a mixup with signed/unsigned offsets when prepping for writing to
     the cache that leads to missing error detection.

 (6) Fix a wrong ifdef hiding a wait.

David

The netfslib postings:
Link: https://lore.kernel.org/r/20231013160423.2218093-1-dhowells@redhat.com/ # v1
Link: https://lore.kernel.org/r/20231117211544.1740466-1-dhowells@redhat.com/ # v2
Link: https://lore.kernel.org/r/20231207212206.1379128-1-dhowells@redhat.com/ # v3
Link: https://lore.kernel.org/r/20231213152350.431591-1-dhowells@redhat.com/ # v4
Link: https://lore.kernel.org/r/20231221132400.1601991-1-dhowells@redhat.com/ # v5
Link: https://lore.kernel.org/r/20240103145935.384404-1-dhowells@redhat.com/ # added patches

David Howells (6):
  netfs: Mark netfs_unbuffered_write_iter_locked() static
  netfs: Count DIO writes
  netfs: Fix interaction between write-streaming and cachefiles culling
  netfs: Fix the loop that unmarks folios after writing to the cache
  cachefiles: Fix signed/unsigned mixup
  netfs: Fix wrong #ifdef hiding wait

 fs/cachefiles/io.c            | 18 +++++++++---------
 fs/netfs/buffered_write.c     | 27 ++++++++++++++++++++++-----
 fs/netfs/direct_write.c       |  5 +++--
 fs/netfs/fscache_stats.c      |  9 ++++++---
 fs/netfs/internal.h           |  8 ++------
 fs/netfs/io.c                 |  2 +-
 fs/netfs/stats.c              | 13 +++++++++----
 include/linux/fscache-cache.h |  3 +++
 include/linux/netfs.h         |  1 +
 9 files changed, 56 insertions(+), 30 deletions(-)

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

