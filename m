Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0271637B
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 May 2023 16:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685456248;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Gc3ggXF//B9HYx1qS6/LhyINc/LktNeTtlqgJ6q9EY=;
	b=MD7VsU+wWdr0nqrqJ+Sxmw6jOYMpptmf+q8GOQq4V21Ysy+Jy0dFyPgzcpyyLmoxGeuZ05
	Uu7F4AWPc9JiBZCeYA3n82dhucMcUiJxrBZtVRBpqOT3bdJ3RwW9/oaing1yPED0TijbMy
	nTcTKyPVBZuB8kX21u5wzralfaLSrMA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-Mkui5PIDOpau1Ttt85OU6A-1; Tue, 30 May 2023 10:17:26 -0400
X-MC-Unique: Mkui5PIDOpau1Ttt85OU6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 180648039AD;
	Tue, 30 May 2023 14:17:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F33A140E955;
	Tue, 30 May 2023 14:17:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E8EF19465B6;
	Tue, 30 May 2023 14:17:24 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4D7801946595 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 30 May 2023 14:17:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 26B0040CFD4B; Tue, 30 May 2023 14:17:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 230E640CFD46;
 Tue, 30 May 2023 14:17:08 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue, 30 May 2023 15:16:27 +0100
Message-ID: <20230530141635.136968-4-dhowells@redhat.com>
In-Reply-To: <20230530141635.136968-1-dhowells@redhat.com>
References: <20230530141635.136968-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH net-next v2 03/10] Wrap lines at 80
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Wrap a line at 80 to stop checkpatch complaining.

Signed-off-by: David Howells <dhowells@redhat.com>
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
cc: Simon Horman <simon.horman@corigine.com>
cc: linux-crypto@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
cc: netdev@vger.kernel.org
---
 fs/netfs/iterator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index f41a37bca1e8..9f09dc30ceb6 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -119,7 +119,8 @@ static ssize_t extract_user_to_sg(struct iov_iter *iter,
 	size_t len, off;
 
 	/* We decant the page list into the tail of the scatterlist */
-	pages = (void *)sgtable->sgl + array_size(sg_max, sizeof(struct scatterlist));
+	pages = (void *)sgtable->sgl +
+		array_size(sg_max, sizeof(struct scatterlist));
 	pages -= sg_max;
 
 	do {
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

