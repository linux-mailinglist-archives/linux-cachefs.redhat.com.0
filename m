Return-Path: <linux-cachefs+bncBCXIHK4S6EJRBXUKSWWQMGQELDNVLQQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 4772C82DB9F
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 Jan 2024 15:46:56 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4298d9ffa96sf114510801cf.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 15 Jan 2024 06:46:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705330015; cv=pass;
        d=google.com; s=arc-20160816;
        b=sR8tnl59Jgte4HKfROi81mHUOokaXu8O5Opm7W2psipswN6BUZzUccPy/NRLtxO9Ai
         FEtDEfi+S5Z8bXXmbRg+nC7eBxvsMmesVI1hDKQWAOrbwPv09jleX10mcVKZcZmTMpjz
         OLhwkVdmcXiiBT+zYrNUAH3wiNkP33A35Zqp/m19pjQJcSc5yhngjIZIVJVvlvRU9D1o
         d6m/atFAf8H51rvVfJ3kQDqJHKCIF/xwD0HBka9BbQ0dzp0QHJ+1oNBAMV0Lkr09ZkeH
         Eu66Bp6dSy3LCtYJqhbkTqpIxkE0fXwrg/NQ2mRORLcOjgmEUzvP8byvUYnn2qh2Id5J
         HuCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=o1H0C/apzQ96aUM7BnCg/lR8UUXoCP9jKzF8XNMI1oc=;
        fh=DRSBjRgTD02DLtkkoDM0n4NBm2CFF3HCdvSoS7G2r2k=;
        b=TLGkt/2kM6G1HpwN0QAI3UJ2Lujyr1PADmsCIS6aehYdZJk8j8S7MqZiDM7JHXmeNh
         dUUbVXQG7ZzjUQELAJ1yoZJRKFBWpQqF54Vb8HAMt4dUqdChYQRqWxtQ0dNGOfRMHnEf
         DawTXJoqRp/AO95njC6kN8KhWkg+Y/SgTH01jNCKZYO2JNhFMD0aEhjwg+CDKT4be+Z2
         8PaGyLfbkjP9hbMfyxLe0NfXKt0WmZJwqNDSZHTo8hFTpqnF6oFcHaRdk9Mu7bswyXjZ
         mq/aej/PmMreDqr41UMT1p1HMxZi9IvGjJ8iCv+oknq26xc2KApA+THq2yXtZUAxkdym
         3LTQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.98 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705330015; x=1705934815;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1H0C/apzQ96aUM7BnCg/lR8UUXoCP9jKzF8XNMI1oc=;
        b=HBAM2UXrE8dmdxfs22lL8Fbg4ADumQVliZ39+sWsuzauEF71thrdESW5c55cJQs5Jl
         AUFLwdp+cHKPOOPcNPuKXfZ23SXZmwjJw9l3dI1z8RHeR0s0gPmy3sdfjyuUIRwd1GMp
         6uvgRObyC90Ix4Y6fNPKP/g0gCapSaaieEZUJG/u1j8mPTkt1hAJF2DcIBm43fCqDJ1Y
         PwzzxW3x2ppFe/tamKu5qX04G5+JhIvikZ9+piNJ9Hzuclx68XqCVdM/hGGbcoLWbcfg
         Z3dK+VPZXynblOifPndQXPr3Sd7QNVHmNnp/VDnXe1Xk5jLKnvEvyBL9TbJGTImMtA5h
         4mpA==
X-Gm-Message-State: AOJu0YyQhAkKHYdllTQM0blgO6lJspogt2bGSfby4U3aJJQpYM5gW1dE
	8hD+QPzIMsLbd2NHbqhZgG8HPJdpGR1Zpw==
X-Google-Smtp-Source: AGHT+IG8lWe3Lc6TRuQibZsvYpB0X3y6kMHrHOa2eWMLPip4GkMsqxecWkdd20PrycNu3ps0TfjblQ==
X-Received: by 2002:ac8:58d5:0:b0:429:fe44:2764 with SMTP id u21-20020ac858d5000000b00429fe442764mr318961qta.20.1705330015084;
        Mon, 15 Jan 2024 06:46:55 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1814:b0:429:fa95:a287 with SMTP id
 t20-20020a05622a181400b00429fa95a287ls450780qtc.1.-pod-prod-07-us; Mon, 15
 Jan 2024 06:46:54 -0800 (PST)
X-Received: by 2002:a37:f518:0:b0:783:52fe:a3fc with SMTP id l24-20020a37f518000000b0078352fea3fcmr3987313qkk.139.1705330014442;
        Mon, 15 Jan 2024 06:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705330014; cv=none;
        d=google.com; s=arc-20160816;
        b=gVr/KCp8ryLwEWmmFyxtKd9LkslzfOUhA6gfvA5Q+9NRIkihfUVqW1A6vce1ovJ0nm
         HzEqHhgnbmcVIFz378mklJ3EVc9WzDUGTyWQsdRxWTv8Tt4EFYmV2NrY0w6DZXlvuKNE
         L9xHpqtiivP4l6598zzVxXguivdt8eVE66xM1aPLSJq3qgP30TrSzMycTFp20ccc34jp
         iM4LK82CkzgoETz5DssBnKWhR7UzEbYE39nZWPXky+TjEOrL4YQD8Sl4cfbnkih3wlNX
         cKxMR7uTjeFIgKUh3vX6FUtiodXpBkwG/tfWVvI06CSv5f48tjDmud/FR24OMha3yg3N
         rY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=K/84kuINMKb0BaH2e7YU90sw0Pl8P2f8Jkd6pf4hB2M=;
        fh=DRSBjRgTD02DLtkkoDM0n4NBm2CFF3HCdvSoS7G2r2k=;
        b=voXlKv92mu/Jv/ZOgjKYgAYYRobq8+M3Vaze9pKY/HjyzNGYKPr7zCDBqZdEoodFUL
         P1U54gMmpEPKvOZT+tEcNFZVyHb9iLGJfvYjT6snzCEKgM8M6VqI4sQJ4JF1wnMl+2X2
         5D1SwdMc1ndNEmGt7KFyHXSZW/8EhVv6ay2xTFltghEWfLTpiQJ4Eea+pxJi5f+cjGjN
         AtXbUiG4/gJjjFvUGCsGsyC/CB2pqIdBoN9rnk/58O8/aQCPGbhP76r7qLab29ons7r1
         zCnago9P1Dk8V1p2ynOS0vVnEtaM0DrE9egH/dBFeA1YI1TQ/SVsT7oD556xrtsyr5z5
         s8ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.98 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g13-20020a05620a218d00b00783198f3e05si7739736qka.554.2024.01.15.06.46.54
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 06:46:54 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.98 as permitted sender) client-ip=115.124.30.98;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-YCw4jhwgPy6oFbyE-pz2Vw-1; Mon,
 15 Jan 2024 09:46:53 -0500
X-MC-Unique: YCw4jhwgPy6oFbyE-pz2Vw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 100BC2806408
	for <linux-cachefs@gapps.redhat.com>; Mon, 15 Jan 2024 14:46:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0D0FB492C27; Mon, 15 Jan 2024 14:46:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 059FC492BFA
	for <linux-cachefs@redhat.com>; Mon, 15 Jan 2024 14:46:52 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7E5A81DA8B
	for <linux-cachefs@redhat.com>; Mon, 15 Jan 2024 14:46:52 +0000 (UTC)
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-297-W4Ood54AMoeRfYLTJzFhHA-1; Mon, 15 Jan 2024 09:46:48 -0500
X-MC-Unique: W4Ood54AMoeRfYLTJzFhHA-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0W-j2-v8_1705329996
Received: from e69b19392.et15sqa.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0W-j2-v8_1705329996)
          by smtp.aliyun-inc.com;
          Mon, 15 Jan 2024 22:46:41 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	David Howells <dhowells@redhat.com>,
	Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH v3 3/4] erofs: Don't use certain unnecessary folio_*() functions
Date: Mon, 15 Jan 2024 22:46:35 +0800
Message-Id: <20240115144635.1931422-1-hsiangkao@linux.alibaba.com>
In-Reply-To: <20240115083337.1355191-1-hsiangkao@linux.alibaba.com>
References: <20240115083337.1355191-1-hsiangkao@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.98 as permitted
 sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
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

From: David Howells <dhowells@redhat.com>

Filesystems should use folio->index and folio->mapping, instead of
folio_index(folio), folio_mapping() and folio_file_mapping() since
they know that it's in the pagecache.

Change this automagically with:

perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/erofs/*.c

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: Yue Hu <huyue2@coolpad.com>
Cc: Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
change since v2:
 - update the words s/internal/unnecessary/ in the subject line
   pointed out by Matthew.

 fs/erofs/fscache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index 87ff35bff8d5..bc12030393b2 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -165,10 +165,10 @@ static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
 static int erofs_fscache_meta_read_folio(struct file *data, struct folio *folio)
 {
 	int ret;
-	struct erofs_fscache *ctx = folio_mapping(folio)->host->i_private;
+	struct erofs_fscache *ctx = folio->mapping->host->i_private;
 	struct erofs_fscache_request *req;
 
-	req = erofs_fscache_req_alloc(folio_mapping(folio),
+	req = erofs_fscache_req_alloc(folio->mapping,
 				folio_pos(folio), folio_size(folio));
 	if (IS_ERR(req)) {
 		folio_unlock(folio);
@@ -276,7 +276,7 @@ static int erofs_fscache_read_folio(struct file *file, struct folio *folio)
 	struct erofs_fscache_request *req;
 	int ret;
 
-	req = erofs_fscache_req_alloc(folio_mapping(folio),
+	req = erofs_fscache_req_alloc(folio->mapping,
 			folio_pos(folio), folio_size(folio));
 	if (IS_ERR(req)) {
 		folio_unlock(folio);
-- 
2.39.3

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

