Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F558764EB7
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Jul 2023 11:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690448976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wRq1bXiQj0EsxKyUxfVnhY7Mewkg24biSxcudZjYAwA=;
	b=A43uttn/bZ+mbz/gWByRnSiB7gqiCD4zXCwtx3MSpXAzrYn9o30ANekWPBbGuM0kOJ7MJy
	kJ+XY3r0EEl9sXZ0pSy3bmT8nGQ+uVLGOlYFwM4MPDioAUGNvDO7PtLW71XmGB+4s6UI3O
	dUVda6S0t7wMR8lqGABy4MRuQyDPl7Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-HyozOVOTMVGsbJygSqW8-g-1; Thu, 27 Jul 2023 05:09:33 -0400
X-MC-Unique: HyozOVOTMVGsbJygSqW8-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B19B9805951;
	Thu, 27 Jul 2023 09:09:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BABB40C2063;
	Thu, 27 Jul 2023 09:09:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 050221946A72;
	Thu, 27 Jul 2023 09:09:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FC791946A69 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 13:38:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 878E22166B26; Wed, 26 Jul 2023 13:38:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EA752166B25
 for <linux-cachefs@redhat.com>; Wed, 26 Jul 2023 13:38:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D9148022EF
 for <linux-cachefs@redhat.com>; Wed, 26 Jul 2023 13:38:18 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-vy-4q1KyOy6ImCXEKsLetA-1; Wed, 26 Jul 2023 09:38:15 -0400
X-MC-Unique: vy-4q1KyOy6ImCXEKsLetA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31779e89e39so138112f8f.2
 for <linux-cachefs@redhat.com>; Wed, 26 Jul 2023 06:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690378694; x=1690983494;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8Z700vzR7baDs8b/e0kEl1jWEWNlBZFJe5eJ9LWL2M=;
 b=JryJGTTi2IMm+PnPBlFA6BEUdXwciRe8mVWE6qCy4aNyKE3/PYRXl6YfDdKNAqXZtV
 sNN/yKl/ymrmWdWH4myUygj1xfHcac7i/3Gkz9lGAGlkKbOKRqoXNLGl6YJlx1Ac4lNM
 VWeiNBNx6xuWqxWg8fD3Jag1NkJ0CyBlZ5GbNYDdxL1lTbjeCMegp2ArSCne9bLiBBGF
 LThzN5/6N4fqh8G16wwJHXWfj5rC0UbbEYXbIvTCQoy6f2539J67SS1OOoBr4khhoSpz
 X45+GHvfNcCS79XHKsYInl3mY/oF72WP4u1i9zWY2EGpi+KK6ncueFTMvykDZ9DQPSI2
 TGrQ==
X-Gm-Message-State: ABy/qLbStLtUC6VxjnaCkYTWGc5MM2AJkOWdLvb6YPfr6RkGBbvY481Y
 pHl7Y3r/zMG4Ozm/qnHOpcX5+MmMyIpgenBoEiGnb4lczjrNQYqxz4pLG9oCadxRVQ7Ju/ARAFC
 89EZofbVQ04WAqmFFbOR7Yg==
X-Received: by 2002:a5d:468b:0:b0:317:59c8:17bc with SMTP id
 u11-20020a5d468b000000b0031759c817bcmr1262948wrq.15.1690378694089; 
 Wed, 26 Jul 2023 06:38:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFW6fWGnz4rPcAEd3A5rxFde+FjwCaa7dB2oKhB0S6J5Gte5BzfN0mtzCoUlg3SX0ZdBK9MJw==
X-Received: by 2002:a5d:468b:0:b0:317:59c8:17bc with SMTP id
 u11-20020a5d468b000000b0031759c817bcmr1262918wrq.15.1690378693599; 
 Wed, 26 Jul 2023 06:38:13 -0700 (PDT)
Received: from [192.168.3.108] (p5b0c6c57.dip0.t-ipconnect.de. [91.12.108.87])
 by smtp.gmail.com with ESMTPSA id
 k11-20020adfd84b000000b0031773e3cf46sm2867991wrl.61.2023.07.26.06.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 06:38:13 -0700 (PDT)
Message-ID: <416eca24-6baf-69d9-21a2-c434a9744596@redhat.com>
Date: Wed, 26 Jul 2023 15:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: David Howells <dhowells@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Steve French <sfrench@samba.org>
References: <20571.1690369076@warthog.procyon.org.uk>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20571.1690369076@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Thu, 27 Jul 2023 09:08:20 +0000
Subject: Re: [Linux-cachefs] [PATCH] crypto,
 cifs: Fix error handling in extract_iter_to_sg()
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-cifs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 netdev@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-cachefs@redhat.com, Sven Schnelle <svens@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 akpm@linux-foundation.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 26.07.23 12:57, David Howells wrote:
>      
> Fix error handling in extract_iter_to_sg().  Pages need to be unpinned, not
> put in extract_user_to_sg() when handling IOVEC/UBUF sources.
> 
> The bug may result in a warning like the following:
> 
>    WARNING: CPU: 1 PID: 20384 at mm/gup.c:229 __lse_atomic_add arch/arm64/include/asm/atomic_lse.h:27 [inline]
>    WARNING: CPU: 1 PID: 20384 at mm/gup.c:229 arch_atomic_add arch/arm64/include/asm/atomic.h:28 [inline]
>    WARNING: CPU: 1 PID: 20384 at mm/gup.c:229 raw_atomic_add include/linux/atomic/atomic-arch-fallback.h:537 [inline]
>    WARNING: CPU: 1 PID: 20384 at mm/gup.c:229 atomic_add include/linux/atomic/atomic-instrumented.h:105 [inline]
>    WARNING: CPU: 1 PID: 20384 at mm/gup.c:229 try_grab_page+0x108/0x160 mm/gup.c:252
>    ...
>    pc : try_grab_page+0x108/0x160 mm/gup.c:229
>    lr : follow_page_pte+0x174/0x3e4 mm/gup.c:651
>    ...
>    Call trace:
>     __lse_atomic_add arch/arm64/include/asm/atomic_lse.h:27 [inline]
>     arch_atomic_add arch/arm64/include/asm/atomic.h:28 [inline]
>     raw_atomic_add include/linux/atomic/atomic-arch-fallback.h:537 [inline]
>     atomic_add include/linux/atomic/atomic-instrumented.h:105 [inline]
>     try_grab_page+0x108/0x160 mm/gup.c:252
>     follow_pmd_mask mm/gup.c:734 [inline]
>     follow_pud_mask mm/gup.c:765 [inline]
>     follow_p4d_mask mm/gup.c:782 [inline]
>     follow_page_mask+0x12c/0x2e4 mm/gup.c:839
>     __get_user_pages+0x174/0x30c mm/gup.c:1217
>     __get_user_pages_locked mm/gup.c:1448 [inline]
>     __gup_longterm_locked+0x94/0x8f4 mm/gup.c:2142
>     internal_get_user_pages_fast+0x970/0xb60 mm/gup.c:3140
>     pin_user_pages_fast+0x4c/0x60 mm/gup.c:3246
>     iov_iter_extract_user_pages lib/iov_iter.c:1768 [inline]
>     iov_iter_extract_pages+0xc8/0x54c lib/iov_iter.c:1831
>     extract_user_to_sg lib/scatterlist.c:1123 [inline]
>     extract_iter_to_sg lib/scatterlist.c:1349 [inline]
>     extract_iter_to_sg+0x26c/0x6fc lib/scatterlist.c:1339
>     hash_sendmsg+0xc0/0x43c crypto/algif_hash.c:117
>     sock_sendmsg_nosec net/socket.c:725 [inline]
>     sock_sendmsg+0x54/0x60 net/socket.c:748
>     ____sys_sendmsg+0x270/0x2ac net/socket.c:2494
>     ___sys_sendmsg+0x80/0xdc net/socket.c:2548
>     __sys_sendmsg+0x68/0xc4 net/socket.c:2577
>     __do_sys_sendmsg net/socket.c:2586 [inline]
>     __se_sys_sendmsg net/socket.c:2584 [inline]
>     __arm64_sys_sendmsg+0x24/0x30 net/socket.c:2584
>     __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
>     invoke_syscall+0x48/0x114 arch/arm64/kernel/syscall.c:52
>     el0_svc_common.constprop.0+0x44/0xe4 arch/arm64/kernel/syscall.c:142
>     do_el0_svc+0x38/0xa4 arch/arm64/kernel/syscall.c:191
>     el0_svc+0x2c/0xb0 arch/arm64/kernel/entry-common.c:647
>     el0t_64_sync_handler+0xc0/0xc4 arch/arm64/kernel/entry-common.c:665
>     el0t_64_sync+0x19c/0x1a0 arch/arm64/kernel/entry.S:591
> 
> Fixes: 018584697533 ("netfs: Add a function to extract an iterator into a scatterlist")
> Reported-by: syzbot+9b82859567f2e50c123e@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-mm/000000000000273d0105ff97bf56@google.com/
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Sven Schnelle <svens@linux.ibm.com>
> cc: akpm@linux-foundation.org
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Steve French <sfrench@samba.org>
> cc: Shyam Prasad N <nspmangalore@gmail.com>
> cc: Rohith Surabattula <rohiths.msft@gmail.com>
> cc: Jens Axboe <axboe@kernel.dk>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Eric Dumazet <edumazet@google.com>
> cc: Jakub Kicinski <kuba@kernel.org>
> cc: Paolo Abeni <pabeni@redhat.com>
> cc: Matthew Wilcox <willy@infradead.org>
> cc: linux-mm@kvack.org
> cc: linux-crypto@vger.kernel.org
> cc: linux-cachefs@redhat.com
> cc: linux-cifs@vger.kernel.org
> cc: linux-fsdevel@vger.kernel.org
> cc: netdev@vger.kernel.org
> ---
>   lib/scatterlist.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/scatterlist.c b/lib/scatterlist.c
> index e86231a44c3d..c65566b4dc66 100644
> --- a/lib/scatterlist.c
> +++ b/lib/scatterlist.c
> @@ -1148,7 +1148,7 @@ static ssize_t extract_user_to_sg(struct iov_iter *iter,
>   
>   failed:
>   	while (sgtable->nents > sgtable->orig_nents)
> -		put_page(sg_page(&sgtable->sgl[--sgtable->nents]));
> +		unpin_user_page(sg_page(&sgtable->sgl[--sgtable->nents]));
>   	return res;
>   }
>   
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

