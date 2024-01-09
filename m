Return-Path: <linux-cachefs+bncBCXIHK4S6EJRBTMY62WAMGQEOOUPJ5I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7A828C23
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 19:11:26 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-680c651928esf60893566d6.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 10:11:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704823886; cv=pass;
        d=google.com; s=arc-20160816;
        b=wb0b3r3GekZOYR/45F9XHJdfONrP2mvyHlb0ffzNys+dryN4ICXjs/6fr8v4A697qn
         Ndt+/QZmtzaCtrKWifuHReyduXTKUn2enP3GkIzwYoIuaP/KmJJDk5bcgBUNm5CCgXKe
         Ihi4Db7vqqyNjAlv+M0Gn71tafEQ+vekMZDe9N7W3C9ogtyvRrkLY96f3XIt/31RUu/I
         NTGHCVNy3K9sopnJKbICLlFY21NVGkp5QgUhQXncvRa7+bXFZZrV0ldLFUFv+fyqlNe0
         0bT3nWO1Jlj7PPutQMiVGMJ0NAzEq9sq/MPBdZKmpz/cd8oG1I+4Vllqg9OqsAesTv1Y
         TE5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=63ksWzggUDQ/XSbgu9j1DQJ/hxkfbONfaPUHdX79mO4=;
        fh=4sZw2kzZN7mrNw2cF7nln3pFlWzIJzWBfyVU7vA/aoQ=;
        b=N8g7SXCJdPBWoOEjrDuGfgnfG/wTNk08DJWJ9QGJm7af/yoe2YN0inOREEwufUj8ZE
         6KqZzw0opVTpBQtBe/ppa1AFTPXlyJMGfwlOR1NTOv4JXrfHGiCgX/LG515A1WNRo7bM
         w61IEBCL0BKdMWp2V3XdsvpqbB5FyADt5VthUhqypYSaZWjuVWdh+mByyqNgx6jDqluN
         4P57Z+V+aIoHiNokqfUR8BQQC5imgQvUF2JCps7UlwStw+CJYkWWl2Qrt2NRvkZJs8FA
         lFJu3pBRZRfwaqEb2YShHkEHdgtAIEN7sF8GAFVglXWjVZ/mwAqdUOnHHPNlOClFgByc
         spHg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.98 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823886; x=1705428686;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63ksWzggUDQ/XSbgu9j1DQJ/hxkfbONfaPUHdX79mO4=;
        b=NZwkjNz8v8G5qZZKwbTB0bPoUWEpcPnjO/E7tyHoVT9xy6msm5amaOIA2u9AKmcTRm
         aDxB6T41DrxkjVD/NV5C4kfSMu+V6bLOxNOFQ7dbxeF7XsF44RjPeEFS+6x9uKPs4CYq
         VgP0MUhqgZ8l/Ix5+JZ0fRtC/GEiEEmQwmfzLXCSSpGXe+CryCcasdYrddwi6fFOjDh5
         pk0Rsr4MzmrSOtylZ5OVaTllcBFg0U347+1NLYuEOKk6ES4rO6LRS+T/2cZRvWQPCNsJ
         2kgRpEVVyP4mcjcl0GpuRjN9LDqXQU+zzPmcGT58RVboZDudUGnDUzbabQJ1n1QwU0Ub
         VzlA==
X-Gm-Message-State: AOJu0Ywl92SSN+yMuzGtnROhw60cAi/Jq1eB74kwsN/jIExwbky2X4gc
	gEqV4Xth40CsGAg2+2nFaXQ/pTozVKADXw==
X-Google-Smtp-Source: AGHT+IEKQxywVEn24PvJEvcL2UNT3MFhCyO5XozwmAnLGHfdvceflEjXHc/38x6xKgqskVcPk54lNQ==
X-Received: by 2002:a05:6214:f2d:b0:67a:a721:9e91 with SMTP id iw13-20020a0562140f2d00b0067aa7219e91mr6230576qvb.66.1704823885890;
        Tue, 09 Jan 2024 10:11:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:21e8:b0:67f:143c:57c3 with SMTP id
 p8-20020a05621421e800b0067f143c57c3ls1572509qvj.0.-pod-prod-03-us; Tue, 09
 Jan 2024 10:11:25 -0800 (PST)
X-Received: by 2002:a05:6102:1526:b0:466:f7db:1f18 with SMTP id f38-20020a056102152600b00466f7db1f18mr2386397vsv.16.1704823885240;
        Tue, 09 Jan 2024 10:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823885; cv=none;
        d=google.com; s=arc-20160816;
        b=D8aXnjQ9xB+GGBvX9c4GnHarVWpL6HtmM+DFkAqCQfxWvfCFowieYArRJnCuNDvjWu
         I969x6Xg8cmpWbTx7YKxBD6T3ga7AVafbOA/DHfysy4vljN8iAWs+hosLKohaG53jwFI
         deQfUinSz+XctBKPI6SiAHVRmyhYnyDNr+GLpifdr3JYbLQn64+9pcpCZrODPYqzEU5l
         DbuHrLQqKCqbmrnflVyDmZ8nREBI+lRW7I2KuPBU1CMLandf3Eb5rBMHKETAptBwxGWJ
         Ah8Xrn4h5gqIU+JphPfjh911gqUc0KcltFXhLffDhF1bFy2yft2Zf8PIKzI4PItAcvDE
         0atA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=Zq4C/p3LP7aTVTSvQDdWZw7hWF41Ime+Zohd6uLB4vM=;
        fh=4sZw2kzZN7mrNw2cF7nln3pFlWzIJzWBfyVU7vA/aoQ=;
        b=tg09WueqUfG50i7oEaq703wReeftqhIu221/kHce+gCzSTgwBRY4Wqr1XhRgpClt7M
         d8H/ZUxGfWvgQ0Thi5ULFSfXreMxKMtS9EiRcT0Ko9V3pwZ3BO7Qi+7x7fXHc3CW1hjd
         sgQu7su7ydnsVqSySvI5Mirs7v4DKsvKDvI5ZXUuK9tBFWOFKjv2+sCu7aNLLG9q8EKZ
         Tvip3GxHjhfxhpHQWPws0rvzPaduC+bHkDpKXZPYjkdF/akAL/PcBWWw2NFgzvdqJ5Au
         sIc2/H9OmbeL2TtZxH73bpvPDnb8Uw2I4DdA0NpQHUlyRW/A1J7yE1waw4VnvSDeHGCk
         GPxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.98 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id m3-20020a67bb03000000b00467047a6b22si440862vsn.208.2024.01.09.10.11.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.98 as permitted sender) client-ip=115.124.30.98;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-Ih3hxwN9M1CHIQ3eNEub9A-1; Tue, 09 Jan 2024 13:11:22 -0500
X-MC-Unique: Ih3hxwN9M1CHIQ3eNEub9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3545185A786
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 18:11:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C03F91C060B1; Tue,  9 Jan 2024 18:11:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B864B1C060AF
	for <linux-cachefs@redhat.com>; Tue,  9 Jan 2024 18:11:21 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 933211C05193
	for <linux-cachefs@redhat.com>; Tue,  9 Jan 2024 18:11:21 +0000 (UTC)
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-360-9N1mpyANOKK2iD_3VjWPkQ-1; Tue, 09 Jan 2024 13:11:17 -0500
X-MC-Unique: 9N1mpyANOKK2iD_3VjWPkQ-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0W-JAUV5_1704823869
Received: from 30.25.253.88(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0W-JAUV5_1704823869)
          by smtp.aliyun-inc.com;
          Wed, 10 Jan 2024 02:11:12 +0800
Message-ID: <97d0e776-d672-405a-9359-fb7f16969dc3@linux.alibaba.com>
Date: Wed, 10 Jan 2024 02:11:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] erofs: Don't use certain internal folio_*() functions
To: David Howells <dhowells@redhat.com>,
 Christian Brauner <christian@brauner.io>, Jeff Layton <jlayton@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>
Cc: Steve French <smfrench@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Marc Dionne <marc.dionne@auristor.com>, Paulo Alcantara <pc@manguebit.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
References: <20240109180117.1669008-1-dhowells@redhat.com>
 <20240109180117.1669008-4-dhowells@redhat.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20240109180117.1669008-4-dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
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



On 2024/1/10 02:01, David Howells wrote:
> Filesystems should not be using folio->index not folio_index(folio) and
> folio->mapping, not folio_mapping() or folio_file_mapping() in filesystem
> code.
> 
> Change this automagically with:
> 
> perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
> perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
> perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/erofs/*.c
> 
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Gao Xiang <xiang@kernel.org>
> cc: Chao Yu <chao@kernel.org>
> cc: Yue Hu <huyue2@coolpad.com>
> cc: Jeffle Xu <jefflexu@linux.alibaba.com>
> cc: linux-erofs@lists.ozlabs.org
> cc: linux-fsdevel@vger.kernel.org

Thank you, David!

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

(I've asked Jingbo to find some free slot to refine
  this part for later compressed data adaption.  Yet that
  is another separate story.  The patch looks good to me.)

Thanks,
Gao Xiang

> ---
>   fs/erofs/fscache.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 87ff35bff8d5..bc12030393b2 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -165,10 +165,10 @@ static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
>   static int erofs_fscache_meta_read_folio(struct file *data, struct folio *folio)
>   {
>   	int ret;
> -	struct erofs_fscache *ctx = folio_mapping(folio)->host->i_private;
> +	struct erofs_fscache *ctx = folio->mapping->host->i_private;
>   	struct erofs_fscache_request *req;
>   
> -	req = erofs_fscache_req_alloc(folio_mapping(folio),
> +	req = erofs_fscache_req_alloc(folio->mapping,
>   				folio_pos(folio), folio_size(folio));
>   	if (IS_ERR(req)) {
>   		folio_unlock(folio);
> @@ -276,7 +276,7 @@ static int erofs_fscache_read_folio(struct file *file, struct folio *folio)
>   	struct erofs_fscache_request *req;
>   	int ret;
>   
> -	req = erofs_fscache_req_alloc(folio_mapping(folio),
> +	req = erofs_fscache_req_alloc(folio->mapping,
>   			folio_pos(folio), folio_size(folio));
>   	if (IS_ERR(req)) {
>   		folio_unlock(folio);
> 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

