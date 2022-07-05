Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED75662F1
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Jul 2022 08:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657001495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fP6WLPEDuLa9euTyz102OcyaykVM+IIOhjlsh6JuyXM=;
	b=bUpZarl/w7z2POV550iSnk8eO3yTNYXhXEW16/lu3C9DMbGu5AgMIm37S+1FDj4s74pQGh
	vLsvUb7MRBSLKyZg4eFHSYUhrO9YXiNhHIo7oVAM40662TbbXYWWe8RScb5XWl1jSUWtXH
	LMcc+LxGmGnvVrqarAkBo2+bwF+X57A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-Ws3LP9xQOEKrb0n5DHGhCA-1; Tue, 05 Jul 2022 02:11:33 -0400
X-MC-Unique: Ws3LP9xQOEKrb0n5DHGhCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E0D83C0D185;
	Tue,  5 Jul 2022 06:11:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D13D9D7F;
	Tue,  5 Jul 2022 06:11:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F06A01947056;
	Tue,  5 Jul 2022 06:11:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C0398194704A for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Jul 2022 06:11:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8EF6C416362; Tue,  5 Jul 2022 06:11:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AE4641617E
 for <linux-cachefs@redhat.com>; Tue,  5 Jul 2022 06:11:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BE8F802D1C
 for <linux-cachefs@redhat.com>; Tue,  5 Jul 2022 06:11:29 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-NoXlFIGmORaOskZxYFrKYw-1; Tue, 05 Jul 2022 02:11:28 -0400
X-MC-Unique: NoXlFIGmORaOskZxYFrKYw-1
Received: by mail-pj1-f71.google.com with SMTP id
 oc6-20020a17090b1c0600b001ef75cb2382so4962088pjb.8
 for <linux-cachefs@redhat.com>; Mon, 04 Jul 2022 23:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QHsZpO8jdgHqT5SmUpNg14nO4ITXQI6OxQXT89xNPRM=;
 b=xfE6kQdsm7qQcO1JdKlWRnQVFin8xQpp3nWDCy/c+12w4VCMNSmRItr9rq4Uh7PlOc
 opsCUpuCpe1flSl3J2ROm8sA+53nxILLBR5s3rKp2Mg8XV0L88zCeCLyEPgYdxwvJAHH
 aPc+2IsczmAkaocJiCq8dqICN+1XwXRvjPjMfSINvHTNRvAc4uDBLz7OwSW6omyxshgS
 N+KhTwXF2bdz8+iY9x23sCo+zTNQtJ2nvlFJqq6dSDxtM8LWUnPCPsChOnB5LoYl85Gu
 0qLjjNXSr5g784Mgoyv18vWgM+76DRO8s60iQc75Rxsoi+wWcE8PZoQiUjZyyuPp6y/o
 8/rQ==
X-Gm-Message-State: AJIora8UxtVM8BcUTWiswlfT+rx7YXShO26Yd+vFDwSwHkM7/S+V0M6O
 ALOZAgqpI0ynZS323Dti0z9h1aa6Oj6d6ZdXCzVuEqacjHTLtU43DwpS7rRtBi3pMlYCafbE1Pw
 mu10QrHBmo06K6dWqgOVGEjaqtZyxRVY923VRYRMeCn5s/tZJUBvcQIZcTB2xo6U7u7XO+JQ=
X-Received: by 2002:a65:4907:0:b0:3fd:bc3e:fb0a with SMTP id
 p7-20020a654907000000b003fdbc3efb0amr27251718pgs.123.1657001486813; 
 Mon, 04 Jul 2022 23:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEko2VtAQRyg0mb3j/Cx6ZkF9nqsprjC9s4bqY54uQ4+IbeXbfDUKMsX2dsTHZgTrRxxklAQ==
X-Received: by 2002:a65:4907:0:b0:3fd:bc3e:fb0a with SMTP id
 p7-20020a654907000000b003fdbc3efb0amr27251698pgs.123.1657001486525; 
 Mon, 04 Jul 2022 23:11:26 -0700 (PDT)
Received: from [10.72.12.186] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902c10c00b0016be6e954e8sm2890275pli.68.2022.07.04.23.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 23:11:25 -0700 (PDT)
To: dhowells@redhat.com
References: <20220705022219.286459-1-xiubli@redhat.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <2dcc7854-643c-0c77-b0b6-9443b9ee1dcd@redhat.com>
Date: Tue, 5 Jul 2022 14:11:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220705022219.286459-1-xiubli@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [RFC PATCH] netfs: do not get the folio
 reference twice
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, keescook@chromium.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 7/5/22 10:22 AM, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
>
> And also the comment said it will drop the folio references but
> the code was increasing it.
>
> Signed-off-by: Xiubo Li <xiubli@redhat.com>
> ---
>   fs/netfs/buffered_read.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> index 5b93e22397fe..a44a5b3b8d4c 100644
> --- a/fs/netfs/buffered_read.c
> +++ b/fs/netfs/buffered_read.c
> @@ -396,9 +396,6 @@ int netfs_write_begin(struct netfs_inode *ctx,
>   	 */
>   	ractl._nr_pages = folio_nr_pages(folio);
>   	netfs_rreq_expand(rreq, &ractl);
> -
> -	/* We hold the folio locks, so we can drop the references */
> -	folio_get(folio);
>   	while (readahead_folio(&ractl))
>   		;
>   

Will drop this patch, the above fix it incorrect.

Thanks!

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

