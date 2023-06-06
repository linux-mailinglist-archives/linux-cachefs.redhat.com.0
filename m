Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A847F72450E
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Jun 2023 15:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686059968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2y6OXN1XbF95vpD/th+IMnA5N+e8LGz9McPKLejvv/I=;
	b=iEcSojZxdKE1RfuMV1H6mUwBVpM7d+mDn6G+pFdkozeWwFuXvJmeK8lqGVKpaug23pjxy4
	kBhlxHjoDNDve8Uv18R7I+YxHJaUS/uObpkNvwD3C3BADCFk/BDSsrnr3Nf02YSd1Wp+cv
	uRUajf2F+jM0HCKjtWKfKOqjSrbIGLI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-IT2hBkQLOtmUVVG5542H4w-1; Tue, 06 Jun 2023 09:59:25 -0400
X-MC-Unique: IT2hBkQLOtmUVVG5542H4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D49913C0BE3F;
	Tue,  6 Jun 2023 13:59:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C58977AE4;
	Tue,  6 Jun 2023 13:59:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6C8741946A42;
	Tue,  6 Jun 2023 13:59:24 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA78E1946595 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 09:00:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A50037AE4; Tue,  6 Jun 2023 09:00:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D8D99E8B
 for <linux-cachefs@redhat.com>; Tue,  6 Jun 2023 09:00:09 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70A9F101A52C
 for <linux-cachefs@redhat.com>; Tue,  6 Jun 2023 09:00:09 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-lt_uoxjsOMaC_VOIiYbUyg-1; Tue, 06 Jun 2023 05:00:06 -0400
X-MC-Unique: lt_uoxjsOMaC_VOIiYbUyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f7e79c69d5so2267205e9.0
 for <linux-cachefs@redhat.com>; Tue, 06 Jun 2023 02:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686042005; x=1688634005;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nE77/PGW00ePiumkpu3hzk+sXBS9GQxpADNCUK4kjrY=;
 b=Xvntn1T4XheZLVFg34HoPbd/zyTIFA8DilmwdBRPurnM+QUywPOmNRe2GNcn6cd5UC
 h5o8CH+FTY+03e7jsu2TkOWIEpcecZneJz5dGqggTu/hucELy9SNYyg79I4Q1aGSyWCu
 Fm9qbUsgscXQjYnHuJpwc4VIWcHs2wBuI8fcmqxwTRKGnDtGw58w2S4hnXwfcjuQHF1v
 dO6c2yrFqhhARBe+LHRl2eWExnP/hQxYqTCZ7UHsLskBq5Fnpl3A8guA6hW2WDN8K95S
 lXzwJwwp6U9CZT1ivS2tF4tFLppzBd6TSAVFqlZK104cpBs+frEQNK+dg3LWH+pUvItl
 s2+A==
X-Gm-Message-State: AC+VfDxYi1ixRBOIQFRlXMijcKAoOGWt/ppLqXo3LBagO+c/0zXbLDZU
 3FX+i+zraxzGHH5fmIrS7lf72x0Nu4m2g5ISgGK9rg8FTgvOkRaBuQHsXHoMxbWk05ZrAMDr8/5
 ZinrFoAFOKArh2mOs2Zx6XA==
X-Received: by 2002:a05:600c:1c26:b0:3f7:3a2f:35ec with SMTP id
 j38-20020a05600c1c2600b003f73a2f35ecmr2121575wms.2.1686042005101; 
 Tue, 06 Jun 2023 02:00:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nMW2ZxYmp2BjKFt0zgPi8AR01qUkYolCtDK0fOgYD9ytZTIMSa1sHbzT24zAhoWWsDDQWaw==
X-Received: by 2002:a05:600c:1c26:b0:3f7:3a2f:35ec with SMTP id
 j38-20020a05600c1c2600b003f73a2f35ecmr2121536wms.2.1686042004812; 
 Tue, 06 Jun 2023 02:00:04 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-114-89.dyn.eolo.it.
 [146.241.114.89]) by smtp.gmail.com with ESMTPSA id
 f18-20020a1cc912000000b003f4e3ed98ffsm13282106wmb.35.2023.06.06.02.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 02:00:04 -0700 (PDT)
Message-ID: <9eb5ab9385ba4af322f5bb9e8c9112414ab7027b.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Date: Tue, 06 Jun 2023 11:00:02 +0200
In-Reply-To: <20230530141635.136968-2-dhowells@redhat.com>
References: <20230530141635.136968-1-dhowells@redhat.com>
 <20230530141635.136968-2-dhowells@redhat.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 06 Jun 2023 13:59:23 +0000
Subject: Re: [Linux-cachefs] [PATCH net-next v2 01/10] Drop the netfs_
 prefix from netfs_extract_iter_to_sg()
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
Cc: Jens Axboe <axboe@kernel.dk>, Shyam Prasad N <nspmangalore@gmail.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, David Ahern <dsahern@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-cachefs@redhat.com, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2023-05-30 at 15:16 +0100, David Howells wrote:
> Rename netfs_extract_iter_to_sg() and its auxiliary functions to drop the
> netfs_ prefix.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Steve French <sfrench@samba.org>
> cc: Shyam Prasad N <nspmangalore@gmail.com>
> cc: Rohith Surabattula <rohiths.msft@gmail.com>
> cc: Jens Axboe <axboe@kernel.dk>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Eric Dumazet <edumazet@google.com>
> cc: Jakub Kicinski <kuba@kernel.org>
> cc: Paolo Abeni <pabeni@redhat.com>
> cc: linux-crypto@vger.kernel.org
> cc: linux-cachefs@redhat.com
> cc: linux-cifs@vger.kernel.org
> cc: linux-fsdevel@vger.kernel.org
> cc: netdev@vger.kernel.org
> ---
> 
> Notes:
>     ver #2:
>      - Put the "netfs_" prefix removal first to shorten lines and avoid
>        checkpatch 80-char warnings.
> 
>  fs/cifs/smb2ops.c     |  4 +--
>  fs/cifs/smbdirect.c   |  2 +-

This patch does not apply anymore to net-next as the cifs contents have
been moved into fs/smb/client.

You need at least to rebase the series on top of commit
38c8a9a52082579090e34c033d439ed2cd1a462d.

Thanks!

Paolo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

