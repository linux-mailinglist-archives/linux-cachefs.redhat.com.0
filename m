Return-Path: <linux-cachefs+bncBDLIXLMFVAERBDHQZCVQMGQEIQBE5VY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888A80938D
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:29 +0100 (CET)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6d9e45e03f6sf473657a34.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984268; cv=pass;
        d=google.com; s=arc-20160816;
        b=hUr4GouUtsfwXkLKLYLF7dOSaqhZUpbdl4CQhU8lCSlOwyDKckTulN3Zr4pl0rVgCw
         gg8z5VoFQeUT7VLnq286oSALf7NcDEfqQaqsoXFhCtxPanOebKRbApNg0s8cjvlgojrU
         cIntKOuSGtMbcr6lCJyY9uMC2//6STE7PlYCZNSmx+AZL3e4jxZiCChcmo/bI9Tz2Nmp
         lgeIBFdYl3nozhn/00GUdx9C+GR1EphdkFR2yrxKEreBzlE9PFCUhYC/A7p4tpL2URa0
         OQdG5JL9SlqsVsXy44ooIvqlspXPW2ltA1kza19pBigMV4nRpDsydsBLJE+/GQFjPkJt
         HLog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=bopuhxba5f+3QoAcr9SYfdWnyVdO+2G4dQ/UaUhfnD4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=P9ZW9v2ldN+cTPsmeO4eAhLcGIR8NPxOoiW7bhBIwuLwT+np+OS7bQnI7kDY5zqyNm
         e24CZR2ASXLD0uKy+U62OgpdUPec0KjaDiCHmJC1hLFjnfCJ5juER++nUBr8IzLue61c
         bVSw9PKtrI50mT2c1ZpxTWipQ9MsqE0NsNTF95jyrx/MkywXSetraN+hU9eEU+yE8bR8
         IIT7CpnILg6/ywfjLKOjffKlttAxRkyaW+W6BPxPDEix1VYlnsZZqPoAu2z9CICe7Vnp
         OxESXI2+vobWHsk5dJEPF/oSmtaq6a0EbBT/3br8r4c0V8fmFpm6kdlqwZeM3hwyDEyp
         j3PA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984268; x=1702589068;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bopuhxba5f+3QoAcr9SYfdWnyVdO+2G4dQ/UaUhfnD4=;
        b=iMeH1OBd1xtyo4VO9C2CQTgPbUVvC4md+V4z+0b2psOoMapsMsdri5OJH44Mmsif50
         FPl3eUyi4SXwq7ceLwGRdqyX4DZ7PtJCi/wQ57dFa5fx/4V5zY4QTkiFFJ2wZRjV5MDM
         rbFdHKIvzSzmwMfM7hP8Tt1gjjUhnp3FM22B1r5kqcwbs6y+coZS8+faOKvcEmJSbjNn
         TpU6SP8XZzoOxZsfEaMDm8DHDk5naWoeZQr8v73ouWcU6s31eRfCwxCQGv3QAbgzZz+d
         IiQ7ToCSnusceAF6D/TGPCPMqSia/Fxn0inMOPmmsskpUNOHz6HRop41A0NXbWNImNKF
         wxXA==
X-Gm-Message-State: AOJu0YzA+swNEdReVg2mo5K+VVjltmgSXhTpecegTBkuh7frQAth0vNC
	4rCT+Vg1EfibKGmjXYF4b8fjZg==
X-Google-Smtp-Source: AGHT+IFlOM7Rrmqz4owTdM060wpZgrQ0IdUTOyUuQBhFbDPd/q5VnLDJI3sF81tUG716dMhaNY0lIw==
X-Received: by 2002:a05:6830:6b81:b0:6d9:e756:ca8a with SMTP id dd1-20020a0568306b8100b006d9e756ca8amr303602otb.21.1701984268457;
        Thu, 07 Dec 2023 13:24:28 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:19a2:b0:423:7c51:c731 with SMTP id
 u34-20020a05622a19a200b004237c51c731ls1581560qtc.2.-pod-prod-05-us; Thu, 07
 Dec 2023 13:24:28 -0800 (PST)
X-Received: by 2002:ac8:57d4:0:b0:423:9512:4bab with SMTP id w20-20020ac857d4000000b0042395124babmr3460934qta.23.1701984267929;
        Thu, 07 Dec 2023 13:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984267; cv=none;
        d=google.com; s=arc-20160816;
        b=JZ9sm/+Mq1Ajno0o61kszmwfCAx7eFcRdVsvjE1PhwSULbl9U1wGf3kmOcALuvfqLK
         qd0o2Y7KYcofPe3K+REAmgPGqkdqkEU8F7dTkTGVykbjQ3gaApqutvSsODdanmUqETwo
         kvJjtFYn5ecBKEA5+qR5cSLhILyah1/Fh3R5VmbnPnmKMtN2vOP52quoCXCBg5AzZN1l
         0ppxsLpwSoz7NNFfLa0hiB9Mx8fzPRsRiwVrXATZLd41JWgDmC1cld/HHp2YySDMwXNs
         1gdtnbhb3zAgzN0Ung3lkr5bx0nw1DhziJvFlvu6smYXV2X/b6zd6V67YsEBb8h0ftJk
         AiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5weY3TAEZXAYDCmBDEVYygYM1kFM1iNPdRbIVf5ORpg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=xe84uiXeI4ziE+8a3obetRnou7eAkUhDB6pOclgRqaY706y3N8kjD364pUR9R8GDUd
         Q4vrOAMQQwktc2R2513AJJ5Q1BaBj4ZhtJLGJ1qVAQj4haGZn4e0pPK46qZGqNFuHtYg
         iurrmkF6BTZ7554hcaWVfFM+nCB0Om9EKs6t8Q3fXiTHoBEhfasomCnkLUzKjFRsFajY
         4csjKG0G4RDPRDtauNDcfq9QozNRdYiMyHBGKKl48WFNFBJzBPboK1xgfKKRvgRkm9IR
         zacfaTpDOdORcr2Q4ACaClCBACV/9HeysT3+lcPbWvoGUi1Ydf7d6VldDMm7w+t6G6os
         U8hg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fe7-20020a05622a4d4700b00423b7f653cesi694399qtb.163.2023.12.07.13.24.27
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-_yXm1PHPMn6n9DHAlwv69g-1; Thu, 07 Dec 2023 16:24:25 -0500
X-MC-Unique: _yXm1PHPMn6n9DHAlwv69g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5B1185A589
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A27BB3C35; Thu,  7 Dec 2023 21:24:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 096233C2E;
	Thu,  7 Dec 2023 21:24:22 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
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
Subject: [PATCH v3 39/59] netfs: Support decryption on ubuffered/DIO read
Date: Thu,  7 Dec 2023 21:21:46 +0000
Message-ID: <20231207212206.1379128-40-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

Support unbuffered and direct I/O reads from an encrypted file.  This may
require making a larger read than is required into a bounce buffer and
copying out the required bits.  We don't decrypt in-place in the user
buffer lest userspace interfere and muck up the decryption.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/direct_read.c | 10 ++++++++++
 fs/netfs/internal.h    | 17 +++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/fs/netfs/direct_read.c b/fs/netfs/direct_read.c
index 52ad8fa66dd5..158719b56900 100644
--- a/fs/netfs/direct_read.c
+++ b/fs/netfs/direct_read.c
@@ -181,6 +181,16 @@ static ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_
 		iov_iter_advance(iter, orig_count);
 	}
 
+	/* If we're going to do decryption or decompression, we're going to
+	 * need a bounce buffer - and if the data is misaligned for the crypto
+	 * algorithm, we decrypt in place and then copy.
+	 */
+	if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags)) {
+		if (!netfs_is_crypto_aligned(rreq, iter))
+			__set_bit(NETFS_RREQ_CRYPT_IN_PLACE, &rreq->flags);
+		__set_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags);
+	}
+
 	/* If we're going to use a bounce buffer, we need to set it up.  We
 	 * will then need to pad the request out to the minimum block size.
 	 */
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index b6c142ef996a..7180e2931189 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -198,6 +198,23 @@ static inline void netfs_put_group_many(struct netfs_group *netfs_group, int nr)
 		netfs_group->free(netfs_group);
 }
 
+/*
+ * Check to see if a buffer aligns with the crypto unit block size.  If it
+ * doesn't the crypto layer is going to copy all the data - in which case
+ * relying on the crypto op for a free copy is pointless.
+ */
+static inline bool netfs_is_crypto_aligned(struct netfs_io_request *rreq,
+					   struct iov_iter *iter)
+{
+	struct netfs_inode *ctx = netfs_inode(rreq->inode);
+	unsigned long align, mask = (1UL << ctx->min_bshift) - 1;
+
+	if (!ctx->min_bshift)
+		return true;
+	align = iov_iter_alignment(iter);
+	return (align & mask) == 0;
+}
+
 /*
  * fscache-cache.c
  */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

