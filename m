Return-Path: <linux-cachefs+bncBDLIXLMFVAERB25ZS2YAMGQEKIERN3Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C73890588
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:38:05 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-69695434a2asf11700896d6.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:38:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643884; cv=pass;
        d=google.com; s=arc-20160816;
        b=bFl5QBaDwYs6snSf5tNRiVVpYxKYy7+F/LmSY3w5lGas5qLkTHDSWkApTlrBmVmKHG
         3Pflt7hyFA5khOcLssuatm9V7rDI95PGJmZUuYnqTB/vX9ofSWSSiS7Zg4cqsDmHXL2J
         7f5BS7OA4sD/uSD2B4dUUUwEnXDF18byaGfBlzoYE40TDK0ie3FEZWAr4Xt7l9fP55hF
         8f6SP+j/dpZ9xRwYQc05he+47imWZ3LHDjsjSsXWMK5tWYsZLy15CbcJBbdN0TEM+C3g
         AJTb/3mJOg9tKqgKAo45CAsoXiN62MxQkiPaUP3WX4/QURsWRcEk5jYr60hohNKqHF1D
         Q+wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=SaBJR9zn6vOzFct+skFwRo4CxktLlEz2ExszkS92XIg=;
        fh=c5V3uFjCoB5HcqCGC1ksorbY/dzYn/wV6DEZNJo5Nm0=;
        b=nLCajEW74PSw04bM/0SLTPTJFUXPoYIjDJHaodEL1A6OqCiGEt85sd/bCNKBpJxUkz
         XSK3PYyfqUX5mbzN1Is9oifoDaogCmUhFNAV8G1l808dbtgMu0nj8zUOy0wTC+4vT4rd
         5/sqZROMbUz/qQupsXXh7S+YEJRwDrhi+QmOdOqG4ORVNiamL3yp9VvFVrhx5C2kCbSW
         Rb3M2Bu0C4A6OOmvm1UDquk1Xv1jLeYqUwtTRONsumWmXBkKEQ+sfPqAfiRCuiMtA04M
         un0QKIl7Fyt/qcQ0bPFba/MdoTGA8cCv1Ya4M4o9sD8enGDYXjqjS1uPXyAQ8YAhD2Tm
         asMQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643884; x=1712248684;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaBJR9zn6vOzFct+skFwRo4CxktLlEz2ExszkS92XIg=;
        b=MBuBMHCiymVyfFSeV7vqBXtiUY7mi3bWnBAZ+JKHBjj2hmsbhGMvhrNN2z9HjXrZ+k
         Qn74XVeAvZEbboskBB4UYn1t5vs/EiHqs3D+UtTafGz+/FMhnw3eIQFpgoyfAhv/m1gf
         9n3AHynFsWtg8NqSRLNH65B5pwXdv3NiT8bT/SwLefWd3ZhIANRR4Jkc3l+vdOer2/LU
         GnqZkxEEV/gW0uzCAyN33fYHcCwmp5OtpfQVu80DPC3ARdpT/7jvKx3abd9R40p2lv3m
         ++QQrf/E+BH0UnUJ2Za0AWr4mHivFIrFyU6DUGH6QczfE3GL8dWw6btayqPtHxW5EAnu
         4Klg==
X-Forwarded-Encrypted: i=2; AJvYcCVib0UKvpFcYo/MOlQpNI85elEET5eR05+oefeRGn081wh1jIds8iob+maAkAAFxeDf51jxqu10E5tPEc8wsoVCnOyr707GMf6/WtY=
X-Gm-Message-State: AOJu0YynnEWcaVe1xg6Uw6Pe4E8N5iRPKk0sZGCTh4xhw6InongPS1BD
	DfqOOWgDdjrLKCUGzyp0CCUXdlZTXwYVKr6SA1FVqCGJTATV08jkXKx+hoXIWpE=
X-Google-Smtp-Source: AGHT+IGzFauTU5HlTRtnw/cLqoB0maNT4BhANxdB/MrjEv4Kezp/5ohC0AavTII20PLtMdsppIDPEQ==
X-Received: by 2002:a0c:c302:0:b0:696:ae38:c846 with SMTP id f2-20020a0cc302000000b00696ae38c846mr3452445qvi.23.1711643884106;
        Thu, 28 Mar 2024 09:38:04 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2627:b0:690:bb85:6016 with SMTP id
 gv7-20020a056214262700b00690bb856016ls422021qvb.0.-pod-prod-02-us; Thu, 28
 Mar 2024 09:38:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHBo3OFysAgGCYxPMEN679Max3dvkQ1o+TTNlVy8qLrIjWpe7nqhlf2QSEkbtIuGh0Cmg9LYBryu02zKlepFOCz7NjGw0kD3jMDxkKXpo=
X-Received: by 2002:a05:620a:3605:b0:78a:5cac:1a5d with SMTP id da5-20020a05620a360500b0078a5cac1a5dmr3006513qkb.15.1711643883463;
        Thu, 28 Mar 2024 09:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643883; cv=none;
        d=google.com; s=arc-20160816;
        b=L4tEwNrrOuGNKiYBRttIemQSfI5lhvGRuT9Rvj5GvDO4SjwreYWXkoIC5uP3YzywZk
         4nAhbQvXGM4ktcjhBMM1c5xmrzjSBbYkAVPRezG8EKXbixPSOEyXDlbtMeRVErhMVkjC
         RyU3oKDMupQIPBydbKOw++PgVRDmpcun1a4/ON2tUF/MlFXvj3v1YtUiJVWSMlHCpV17
         KConbtxJJVitPWUyZ7OcNU6U3kfdkVplS0Z2LCzfHs2bTk7aPlDzhCCU+Ozo0Ot3Vo+N
         hALdSWxGW8V5cJt2aNfKSLqJxxo5Q+pcs9BJ7bu6O/OJHhw4N5EEwii21OAMkkWkilIM
         SD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=YXmc3YCo60jECje6D8F3mfZ1bN1Jr5ynl0cOwSqeZGY=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=ru6EfSXT+zSzneljje8v5yHWOHC4+RwgdexJh5qrFEPhHqp6HuCcOY2ObPGu3Iq9+p
         Iq12Yu/nYZN6nM9rLtCnUUyxBCow/lkTaWpYw2eflpm8G7uHvbMuhVvmnBv4tcQ6AgX4
         S2Uq60oyNgwPV6C5lCZplT9JQITQwobtjyhwLs7RHftfHorvwQUAh0kFqXRwIK0EEk6o
         I5yuzFn1j3jH3DHTUoA5QTXtdWeJHYzfZJp/UYp/RRWSaS/oHFgfULz+S3yK58i5vr7u
         WcmHjUcq9TNpFl4gnlJ+xT1e9FrvNWIrcKHHDwSEfCWuO8QsC28ktp7eZ0GVJYuqbB4W
         dB/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id j25-20020a37ef19000000b00789f23e41cdsi1769884qkk.196.2024.03.28.09.38.03
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-GZNbqaANPEeC5hGLGfFqOg-1; Thu, 28 Mar 2024 12:38:01 -0400
X-MC-Unique: GZNbqaANPEeC5hGLGfFqOg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9141C185A783
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:38:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8E8E4492BDB; Thu, 28 Mar 2024 16:38:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72392492BD0;
	Thu, 28 Mar 2024 16:37:58 +0000 (UTC)
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
Subject: [PATCH 17/26] netfs: Fix writethrough-mode error handling
Date: Thu, 28 Mar 2024 16:34:09 +0000
Message-ID: <20240328163424.2781320-18-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

Fix the error return in netfs_perform_write() acting in writethrough-mode
to return any cached error in the case that netfs_end_writethrough()
returns 0.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/buffered_write.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 8e4a3fb287e3..db4ad158948b 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -188,7 +188,7 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 	enum netfs_how_to_modify howto;
 	enum netfs_folio_trace trace;
 	unsigned int bdp_flags = (iocb->ki_flags & IOCB_SYNC) ? 0: BDP_ASYNC;
-	ssize_t written = 0, ret;
+	ssize_t written = 0, ret, ret2;
 	loff_t i_size, pos = iocb->ki_pos, from, to;
 	size_t max_chunk = PAGE_SIZE << MAX_PAGECACHE_ORDER;
 	bool maybe_trouble = false;
@@ -409,10 +409,12 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 
 out:
 	if (unlikely(wreq)) {
-		ret = netfs_end_writethrough(wreq, iocb);
+		ret2 = netfs_end_writethrough(wreq, iocb);
 		wbc_detach_inode(&wbc);
-		if (ret == -EIOCBQUEUED)
-			return ret;
+		if (ret2 == -EIOCBQUEUED)
+			return ret2;
+		if (ret == 0)
+			ret = ret2;
 	}
 
 	iocb->ki_pos += written;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

