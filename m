Return-Path: <linux-cachefs+bncBCXIHK4S6EJRB54XUKYQMGQEEHL2YTQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA48B009D
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Apr 2024 06:35:04 +0200 (CEST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6a08c9ad789sf11733846d6.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 23 Apr 2024 21:35:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713933303; cv=pass;
        d=google.com; s=arc-20160816;
        b=DH0AovEsy1MFiIGW+vzT+frA8FMIh/pIStuXQUmNwVgdeNH4Cf2t4AjBp5Rv+aU5us
         HPVStiz7HIWFq76fvirMPjSqRjbkpcE5iPhASFIGmcsJMwUM1GdRw5WvgQYq5giUOphA
         S5AQ1i4OQ8B2joz46s+Ri7ELt1lhThRPHY2LxxOIZY/8gIu81su/3IV3GRUIPy+iXptJ
         GqggpFnxlz+bw367vAgr8kqw4NhJnaNQsx5KlCkhYVMrpoC3DwYZ2SAsZbIcRI9vla7H
         QoN0ygUzveBYk8usd1Z0K+budM1GwJXUlvIvw+fgsi5n+Rc++hD4tmjnAXs9/mvA3lOv
         9nMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=8C2odR/JyvL/RgdmllaTHuMNVY4jXVJByLHJFu3ttmQ=;
        fh=Ul4vFBadUdNjhONb/TusbLnHriqDOG+waUxqlUX8vPA=;
        b=Q2rjLrWUq+nf3z78Gk+ZZ7snCH6r0ztCOHvzoQGgB/NOO933TLau1woqpezRbclEUf
         0nlH7GF/j1Ps2VVLhAauhJw5Qdv4gi5P6qxDmgWB/EdJojb5r8/V91aVxm9pP0sb090G
         y4P5iLk+qM3bQRa0ooR8keG5kpW6/UK8MjuKn8q4duKr5TVY+18H4QhMkQlDcQcweti9
         dOvOPFtzwDY0DFECBSeH6XQ+DAs5apvg6gD/XKtV2nDmSX1Qn0J8w9nuK6kLQjnWlOVu
         YxO8V2hQzHltwCy92ltnjLczKlQ9qqHZfVLU/wCTGI53dQ63hs0dDMXUT+oKTZ/rDzwb
         3GDQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 47.90.199.1 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713933303; x=1714538103;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C2odR/JyvL/RgdmllaTHuMNVY4jXVJByLHJFu3ttmQ=;
        b=sf+nsR17HRHHSe0JZXJx/tenvxspXGapoO/WbjCmuJOTOxWb1UBce7nAYBU9v5VHQZ
         jYtHBwM4Mw7zgBOxRVVe3Bw3YaM6Yz/WV41V2dF8UU7lvSvhK+nkjcb/G6UQaO1DhfLF
         XMaCzVvlKtXtAZMNivuEY1vQhECdv4VuKZWFk4DhmPpyXdTYWphq4aF4TcHQKN9pbD8x
         D1vfKD+oTsEiGl6BZeBb8T9XbTtNJb2TKvLJT0oOQxGuX+SICK9hccv8tyVlIgpcsGa8
         5DrQx193TbbdylElAzPKK8V5/hjFksJa7i0RD45x3arTSRGyk49hfdZzmySp0YuXYWU0
         nAhw==
X-Forwarded-Encrypted: i=2; AJvYcCUstkMJS+XeblyDw3FiHIq7/VxzMfqmUwpDSZCEPsVycBNVhT5XYw1IYl5SslNf+/uTU0FyMxj4lx3H0dDDzX9hEtQfiOeUC7upyhE=
X-Gm-Message-State: AOJu0YxqyExi05fJIJatZuobK610S+OiKhytTcxWbCmPz7E1OpiAR3UP
	R7JJuz0cjjKU1qDmBwLpt0yvHkvJ6JMkwkjuef4rqVSQYd5LtraPHroaI2Fg8yM=
X-Google-Smtp-Source: AGHT+IGysEqu22e4Y9uAFDovg9tRURxq8qW1lrOUKW+pHIalxicqyoYlDuC/saBTKQS48YvN89PnOw==
X-Received: by 2002:ad4:4703:0:b0:6a0:9645:526e with SMTP id qb3-20020ad44703000000b006a09645526emr361546qvb.15.1713933303394;
        Tue, 23 Apr 2024 21:35:03 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2605:b0:69b:a44:bb68 with SMTP id
 6a1803df08f44-6a05d4e5a87ls144129636d6.0.-pod-prod-00-us; Tue, 23 Apr 2024
 21:35:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhzU1C5kbNcWAsDv7edPO0sTKunycdCcx1N59jtu7Gr4cFJoBOtSeZkUNNI/w7fkbiKzpKUPjq3Nak3fU+Y5fqzvsRU/USLvq/DW4jBos=
X-Received: by 2002:a05:620a:31a4:b0:790:3f7b:42b1 with SMTP id bi36-20020a05620a31a400b007903f7b42b1mr8950396qkb.17.1713933302696;
        Tue, 23 Apr 2024 21:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713933302; cv=none;
        d=google.com; s=arc-20160816;
        b=OuEMsDGCSsnx01150fewDNAaa+DaEFKLastwSbcm3dJbUiNH4g7snLXIB7ZEDRs92R
         O0NvXQ+QI/l7KVeEHL1eVk3JtRobzoFe3Fs7ny/lesr8jtZLnby/xeOpT1lvlQvoKt01
         5FBdLs35bgF2azr3ODH476/Fx7rTK2DWB5FRyL4TGjT5Snx1xvRpHC7j8I4gpTNMPVW7
         bUF/U0G0phASH75Gxv+uROwjXanAtKE18Siw3RfZJLMFUEzno3W5qCfoOcxWG1eUaPDR
         URhzPpqb9s72hNIppKC+IkT1igLdmlo+rxgUp8ud/C4kkqO7DZEqevHIilUI0rzj4p51
         2K/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=IM9801pvB5uZHmd1rEJHc3tA7W/DHFfufzGQLjxpri4=;
        fh=T5PbMDht0Uap8SMsKx+XGDhisNgfjY3Io8Mtn4MxNYM=;
        b=rXBT+HNgkx1kup8f8C/OKoIKE0hKBxVPXsyngsgIvX2Fu3VyRiAO3noRtjDK6ipCso
         s4U+MI91NJ/y0mAlfASIp9/+852Uz0R7A2B0JqjiOJDGNyHeEFwB19lmfd29yT+GdO86
         /x31/k4uXhGCV9jnNG7+Gswyxzz5bXmMlUcFbKJsdFL5WTpNkNNDp+ahdvEtml04ypSF
         Fbf6NjRuhrTCC2uXwMoIY4SJgXlc8v7NQdOZDuLX+mvovilappWTaMG1ttjwVdjPoiod
         KXCg2p0Cm8ag2zyGr+ok91fzsFvK7OukQvbvu8QeJjxT5B8WPGf6zzCQIZFQFyBtIyJT
         rzCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 47.90.199.1 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id v7-20020a05620a0a8700b0078d61f1059esi14016841qkg.547.2024.04.23.21.35.02
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 21:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 47.90.199.1 as permitted sender) client-ip=47.90.199.1;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-72i5W2DgNbehDBlbEHDQAA-1; Wed, 24 Apr 2024 00:35:01 -0400
X-MC-Unique: 72i5W2DgNbehDBlbEHDQAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4B2180591B
	for <linux-cachefs@gapps.redhat.com>; Wed, 24 Apr 2024 04:35:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D2130C13FA5; Wed, 24 Apr 2024 04:35:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A696C01595
	for <linux-cachefs@redhat.com>; Wed, 24 Apr 2024 04:35:00 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F3DA3C0008F
	for <linux-cachefs@redhat.com>; Wed, 24 Apr 2024 04:35:00 +0000 (UTC)
Received: from out199-1.us.a.mail.aliyun.com (out199-1.us.a.mail.aliyun.com
 [47.90.199.1]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-2nb4OjuYM9imgK_XoysLJQ-1; Wed, 24 Apr 2024 00:34:58 -0400
X-MC-Unique: 2nb4OjuYM9imgK_XoysLJQ-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R371e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067109;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0W5B7uD2_1713932984
Received: from 30.97.48.214(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0W5B7uD2_1713932984)
          by smtp.aliyun-inc.com;
          Wed, 24 Apr 2024 12:29:45 +0800
Message-ID: <de9d403c-c4ed-46c5-a572-18dc48bbd204@linux.alibaba.com>
Date: Wed, 24 Apr 2024 12:29:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] cachefiles: add missing lock protection when polling
To: libaokun@huaweicloud.com, netfs@lists.linux.dev
Cc: dhowells@redhat.com, jlayton@kernel.org, zhujia.zj@bytedance.com,
 jefflexu@linux.alibaba.com, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Baokun Li <libaokun1@huawei.com>
References: <20240424033409.2735257-1-libaokun@huaweicloud.com>
 <20240424033409.2735257-6-libaokun@huaweicloud.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20240424033409.2735257-6-libaokun@huaweicloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 47.90.199.1 as permitted
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

Hi Baokun,

On 2024/4/24 11:34, libaokun@huaweicloud.com wrote:
> From: Jingbo Xu <jefflexu@linux.alibaba.com>
> 
> Add missing lock protection in poll routine when iterating xarray,
> otherwise:
> 
> Even with RCU read lock held, only the slot of the radix tree is
> ensured to be pinned there, while the data structure (e.g. struct
> cachefiles_req) stored in the slot has no such guarantee.  The poll
> routine will iterate the radix tree and dereference cachefiles_req
> accordingly.  Thus RCU read lock is not adequate in this case and
> spinlock is needed here.
> 
> Fixes: b817e22b2e91 ("cachefiles: narrow the scope of triggering EPOLLIN events in ondemand mode")
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

I'm not sure why this patch didn't send upstream,
https://gitee.com/anolis/cloud-kernel/commit/324ecaaa10fefb0e3d94b547e3170e40b90cda1f

But since we're now working on upstreaming, so let's drop
the previous in-house review tags..

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>   fs/cachefiles/daemon.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
> index 6465e2574230..73ed2323282a 100644
> --- a/fs/cachefiles/daemon.c
> +++ b/fs/cachefiles/daemon.c
> @@ -365,14 +365,14 @@ static __poll_t cachefiles_daemon_poll(struct file *file,
>   
>   	if (cachefiles_in_ondemand_mode(cache)) {
>   		if (!xa_empty(&cache->reqs)) {
> -			rcu_read_lock();
> +			xas_lock(&xas);
>   			xas_for_each_marked(&xas, req, ULONG_MAX, CACHEFILES_REQ_NEW) {
>   				if (!cachefiles_ondemand_is_reopening_read(req)) {
>   					mask |= EPOLLIN;
>   					break;
>   				}
>   			}
> -			rcu_read_unlock();
> +			xas_unlock(&xas);
>   		}
>   	} else {
>   		if (test_bit(CACHEFILES_STATE_CHANGED, &cache->flags))

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

