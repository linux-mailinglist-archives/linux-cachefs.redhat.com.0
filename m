Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C716B78B7
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Mar 2023 14:21:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678713679;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q39C3Vf07WJ1kqVFDrc2QxUcuaHAJ08LrCiv26u8fJE=;
	b=RjcmaFnRLry+Xlwyg/FLyCP1fwhRrV6vpBumrOCnX/IPqFfyyzpVKGWIf0BcdVKstwjcfE
	FffO/YTUCntQ+r5S0xlLsM9sBlYmm6JLK/pg7rl8laY6FiI90L/MBwH8uULMDwetLanacU
	GlVF6/f0xWh+UY59K+HtsRBA6Zt9VLg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-QQxoLVfgP3isl-lxmIaq4g-1; Mon, 13 Mar 2023 09:21:18 -0400
X-MC-Unique: QQxoLVfgP3isl-lxmIaq4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF3E228004E2;
	Mon, 13 Mar 2023 13:21:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 334C340C6E68;
	Mon, 13 Mar 2023 13:21:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 073D619465A2;
	Mon, 13 Mar 2023 13:21:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B88C31946588 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 13 Mar 2023 13:21:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99F6D1731B; Mon, 13 Mar 2023 13:21:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92071175AD
 for <linux-cachefs@redhat.com>; Mon, 13 Mar 2023 13:21:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CFFE1C0A58D
 for <linux-cachefs@redhat.com>; Mon, 13 Mar 2023 13:21:14 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-1hbWWWNjNc-eTE4gmm8ikA-1; Mon, 13 Mar 2023 09:21:12 -0400
X-MC-Unique: 1hbWWWNjNc-eTE4gmm8ikA-1
Received: by mail-qt1-f176.google.com with SMTP id l18so13053962qtp.1
 for <linux-cachefs@redhat.com>; Mon, 13 Mar 2023 06:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678713671;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QHO4CXHOhldd2DiUrl/ejsH2q5KI1USw1eGFcu9b0ig=;
 b=IK4jth6o2sSsEPZRBAaxGl7a4e/sXoBfnIrWp93KKlQuCwtnslnIRbEkiW1G9ZEOs0
 Te+JWvQ/dg+5g1h48guiBqpY++hXdLaz1T3PVcHB6yo4qBhdqJ2gsP3hZ9HNndYnXOVh
 70yDfnRNIMSfgQx9cOGA2WJjzzziKGmg+I3/lbNbjPKLhJd+sT811sGTqTs64DMEbFJL
 w/4JhaWZw++OCe13+MKDK8g425eg4dW9nAFUrQbM9pRyf/X5MYekoRH0qKrEaVwFBy11
 Z+O7O6DE3F00DyQ6HaCDPRJyDrUQ/n7C4sS/qp79nJx089ZEMaP7lxmX/rIrYcmJUKEk
 +lgQ==
X-Gm-Message-State: AO0yUKVj5dJYDlcJ8RKPG5fSunychFQFb5yquFbr0KdtYk/sSnVFYPAv
 Y+L0Hi5sxlFs6rZJOpFjhx6ZRQ==
X-Google-Smtp-Source: AK7set+qWcXGYSBmUrPiyqZz3kW+BzfzdfMTNJfcQQkggbUK3AbU2ZrHzChSpTh7a62BChLAPG+PxA==
X-Received: by 2002:a05:622a:1045:b0:3bd:1a07:2063 with SMTP id
 f5-20020a05622a104500b003bd1a072063mr58524181qte.45.1678713671251; 
 Mon, 13 Mar 2023 06:21:11 -0700 (PDT)
Received: from cs.cmu.edu (tunnel29655-pt.tunnel.tserv13.ash1.ipv6.he.net.
 [2001:470:7:582::2]) by smtp.gmail.com with ESMTPSA id
 y1-20020ac87081000000b003b860983973sm5426091qto.60.2023.03.13.06.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 06:21:10 -0700 (PDT)
Date: Mon, 13 Mar 2023 09:21:08 -0400
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20230313132108.5xbzbxz62jjzecat@cs.cmu.edu>
Mail-Followup-To: Luis Chamberlain <mcgrof@kernel.org>, dhowells@redhat.com,
 linux-cachefs@redhat.com, jack@suse.com, anton@tuxera.com,
 linux-ntfs-dev@lists.sourceforge.net, ebiederm@xmission.com,
 keescook@chromium.org, yzaikin@google.com, j.granados@samsung.com,
 patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230310231206.3952808-1-mcgrof@kernel.org>
 <20230310231206.3952808-5-mcgrof@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230310231206.3952808-5-mcgrof@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH 4/5] coda: simplify one-level sysctl
 registration for coda_table
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
Cc: j.granados@samsung.com, keescook@chromium.org,
 linux-ntfs-dev@lists.sourceforge.net, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com, ebiederm@xmission.com,
 jack@suse.com, linux-fsdevel@vger.kernel.org, yzaikin@google.com,
 anton@tuxera.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good to me, nice little cleanup.

Jan

On Fri, Mar 10, 2023 at 07:04:07PM -0500, Luis Chamberlain wrote:
> There is no need to declare an extra tables to just create directory,
> this can be easily be done with a prefix path with register_sysctl().
> 
> Simplify this registration.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Acked-by: Jan Harkes <jaharkes@cs.cmu.edu

> ---
>  fs/coda/sysctl.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/fs/coda/sysctl.c b/fs/coda/sysctl.c
> index fda3b702b1c5..a247c14aaab7 100644
> --- a/fs/coda/sysctl.c
> +++ b/fs/coda/sysctl.c
> @@ -39,19 +39,10 @@ static struct ctl_table coda_table[] = {
>  	{}
>  };
>  
> -static struct ctl_table fs_table[] = {
> -	{
> -		.procname	= "coda",
> -		.mode		= 0555,
> -		.child		= coda_table
> -	},
> -	{}
> -};
> -
>  void coda_sysctl_init(void)
>  {
>  	if ( !fs_table_header )
> -		fs_table_header = register_sysctl_table(fs_table);
> +		fs_table_header = register_sysctl("coda", coda_table);
>  }
>  
>  void coda_sysctl_clean(void)
> -- 
> 2.39.1
> 
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

