Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4B7138BA
	for <lists+linux-cachefs@lfdr.de>; Sun, 28 May 2023 10:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685262846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y0U/Q2hfeJFLhbNW26t5RBIcvtM/orBiVX7gnZmBwB8=;
	b=T1qxsX1cDrg015SC80EWbrTdViHaEPupm7x2EuWCzmsuOaR0QPONEqFLoax6xS9in7b2ib
	jUWw3mIcmHLL+YsBLtHQ/4QvXiVY4AMwWhoOp3Hv1GhB84tSSTGZ1OX2fBNEFIWNNK+RrU
	5dq1xOXZmeaJz3lVFKpprpGjHr1Lvk4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-Xlhrm49DMUC9rj0dzek6cA-1; Sun, 28 May 2023 04:34:03 -0400
X-MC-Unique: Xlhrm49DMUC9rj0dzek6cA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D5ED101A53A;
	Sun, 28 May 2023 08:34:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62AAB40CFD45;
	Sun, 28 May 2023 08:34:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 108C219465A3;
	Sun, 28 May 2023 08:34:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 132CB194658C for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 28 May 2023 08:34:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0113240CFD48; Sun, 28 May 2023 08:34:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3DE740CFD45;
 Sun, 28 May 2023 08:33:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZHH1nqZWOGzxlidT@corigine.com>
References: <ZHH1nqZWOGzxlidT@corigine.com>
 <20230526143104.882842-1-dhowells@redhat.com>
 <20230526143104.882842-2-dhowells@redhat.com>
To: Simon Horman <simon.horman@corigine.com>
MIME-Version: 1.0
Date: Sun, 28 May 2023 09:33:57 +0100
Message-ID: <992934.1685262837@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH net-next 1/8] Move
 netfs_extract_iter_to_sg() to lib/scatterlist.c
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
 Rohith Surabattula <rohiths.msft@gmail.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-cachefs@redhat.com, linux-crypto@vger.kernel.org,
 Shyam Prasad N <nspmangalore@gmail.com>, linux-fsdevel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <992933.1685262837.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If it comes to a respin, I'll stick in an extra patch to fix the spellings -
and if not, I'll submit the patch separately.  It shouldn't be changed in with
the movement of code to give git analysis a better chance of tracking the
movement.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

