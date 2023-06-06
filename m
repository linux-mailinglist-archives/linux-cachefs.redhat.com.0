Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 735847243D1
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Jun 2023 15:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686056990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v6fl02vOl7Jiu6wBMCMyEOwiQlu81Sb3hrNZnZ9PPVU=;
	b=Cjv05sC4w9Wyb6d9ER5m5np1kENaGEecVpNSukj8xFuedFl2RovB9zSMbUCuNSQmMuvDsS
	JMunyMuHIRhow3nKaPpmfnbRx5Tr1g+0/KJZTSqmYIKwghdxNw8YdfZKWA5tzp2TNjI7GG
	hB9Vik63utWdin/QAnrNWe4ybvVcp4o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-SfrBdAwmM8eJFW30JrHciA-1; Tue, 06 Jun 2023 09:09:49 -0400
X-MC-Unique: SfrBdAwmM8eJFW30JrHciA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B71DF1C07840;
	Tue,  6 Jun 2023 13:09:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD5672026D6A;
	Tue,  6 Jun 2023 13:09:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6489019466DF;
	Tue,  6 Jun 2023 13:09:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 61C571946A44 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 13:09:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 46D2520268C2; Tue,  6 Jun 2023 13:09:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11E012026D6A;
 Tue,  6 Jun 2023 13:09:11 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue,  6 Jun 2023 14:08:48 +0100
Message-ID: <20230606130856.1970660-3-dhowells@redhat.com>
In-Reply-To: <20230606130856.1970660-1-dhowells@redhat.com>
References: <20230606130856.1970660-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH net-next v3 02/10] Fix a couple of spelling
 mistakes
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Steve French <sfrench@samba.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>,
 Simon Horman <simon.horman@corigine.com>, David Ahern <dsahern@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-cachefs@redhat.com,
 linux-crypto@vger.kernel.org, Shyam Prasad N <nspmangalore@gmail.com>,
 linux-fsdevel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix a couple of spelling mistakes in a comment.

Suggested-by: Simon Horman <simon.horman@corigine.com>
Link: https://lore.kernel.org/r/ZHH2mSRqeL4Gs1ft@corigine.com/
Link: https://lore.kernel.org/r/ZHH1nqZWOGzxlidT@corigine.com/
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jens Axboe <axboe@kernel.dk>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: "David S. Miller" <davem@davemloft.net>
cc: Eric Dumazet <edumazet@google.com>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-crypto@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
cc: netdev@vger.kernel.org
---
 fs/netfs/iterator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index f8eba3de1a97..f41a37bca1e8 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -312,7 +312,7 @@ static ssize_t extract_xarray_to_sg(struct iov_iter *iter,
 }
 
 /**
- * extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
+ * extract_iter_to_sg - Extract pages from an iterator and add to an sglist
  * @iter: The iterator to extract from
  * @maxsize: The amount of iterator to copy
  * @sgtable: The scatterlist table to fill in
@@ -332,7 +332,7 @@ static ssize_t extract_xarray_to_sg(struct iov_iter *iter,
  * @extraction_flags can have ITER_ALLOW_P2PDMA set to request peer-to-peer DMA
  * be allowed on the pages extracted.
  *
- * If successul, @sgtable->nents is updated to include the number of elements
+ * If successful, @sgtable->nents is updated to include the number of elements
  * added and the number of bytes added is returned.  @sgtable->orig_nents is
  * left unaltered.
  *
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

