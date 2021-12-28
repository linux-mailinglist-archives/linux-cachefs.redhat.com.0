Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6A1482A92
	for <lists+linux-cachefs@lfdr.de>; Sun,  2 Jan 2022 09:22:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-dxr3nYWFOemnuPiM-z4ZCw-1; Sun, 02 Jan 2022 03:22:00 -0500
X-MC-Unique: dxr3nYWFOemnuPiM-z4ZCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEA568042E2;
	Sun,  2 Jan 2022 08:21:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0FF8462F;
	Sun,  2 Jan 2022 08:21:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 95CFC1809C88;
	Sun,  2 Jan 2022 08:21:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BS2rFdw025474 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 21:53:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C9A58407E1CF; Tue, 28 Dec 2021 02:53:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C25B5407E1CE
	for <linux-cachefs@redhat.com>; Tue, 28 Dec 2021 02:53:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8599805BFC
	for <linux-cachefs@redhat.com>; Tue, 28 Dec 2021 02:53:15 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-146-yOHFVa1QNH6pc4D5nqB4SA-1; Mon, 27 Dec 2021 21:53:14 -0500
X-MC-Unique: yOHFVa1QNH6pc4D5nqB4SA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R601e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=joseph.qi@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V00M7xX_1640659669
Received: from 30.225.24.26(mailfrom:joseph.qi@linux.alibaba.com
	fp:SMTPD_---0V00M7xX_1640659669) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 28 Dec 2021 10:47:50 +0800
Message-ID: <d066131d-1bcb-e64d-a10b-b3dbb4506b96@linux.alibaba.com>
Date: Tue, 28 Dec 2021 10:47:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.4.0
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
	linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
	linux-erofs@lists.ozlabs.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-2-jefflexu@linux.alibaba.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20211227125444.21187-2-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sun, 02 Jan 2022 03:21:46 -0500
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 01/23] cachefiles: add
	cachefiles_demand devnode
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/27/21 8:54 PM, Jeffle Xu wrote:
> fscache/cachefiles used to serve as a local cache for remote fs. The
> following patches will introduce a new use case, in which local
> read-only fs could implement demand reading with fscache. By then the
> user daemon needs to read and poll on the devnode, and thus the original
> cachefiles devnode can't be reused in this case.
> 
> Thus create a new devnode specifically for the new mode. The following
> patches will add more file_operations.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/cachefiles/daemon.c   |  8 ++++++++
>  fs/cachefiles/internal.h |  1 +
>  fs/cachefiles/main.c     | 12 ++++++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
> index 40a792421fc1..871f1e0f423d 100644
> --- a/fs/cachefiles/daemon.c
> +++ b/fs/cachefiles/daemon.c
> @@ -56,6 +56,14 @@ const struct file_operations cachefiles_daemon_fops = {
>  	.llseek		= noop_llseek,
>  };
>  
> +const struct file_operations cachefiles_demand_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= cachefiles_daemon_open,
> +	.release	= cachefiles_daemon_release,
> +	.write		= cachefiles_daemon_write,
> +	.llseek		= noop_llseek,
> +};
> +

Better to prepare the on-demand read() and poll() first, and then add
the on-demand cachefiles dev.

Thanks,
Joseph

>  struct cachefiles_daemon_cmd {
>  	char name[8];
>  	int (*handler)(struct cachefiles_cache *cache, char *args);
> diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
> index 421423819d63..e0ed811d628d 100644
> --- a/fs/cachefiles/internal.h
> +++ b/fs/cachefiles/internal.h
> @@ -145,6 +145,7 @@ extern int cachefiles_has_space(struct cachefiles_cache *cache,
>   * daemon.c
>   */
>  extern const struct file_operations cachefiles_daemon_fops;
> +extern const struct file_operations cachefiles_demand_fops;
>  
>  /*
>   * error_inject.c
> diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
> index 3f369c6f816d..0a423274d283 100644
> --- a/fs/cachefiles/main.c
> +++ b/fs/cachefiles/main.c
> @@ -39,6 +39,12 @@ static struct miscdevice cachefiles_dev = {
>  	.fops	= &cachefiles_daemon_fops,
>  };
>  
> +static struct miscdevice cachefiles_demand_dev = {
> +	.minor	= MISC_DYNAMIC_MINOR,
> +	.name	= "cachefiles_demand",
> +	.fops	= &cachefiles_demand_fops,
> +};
> +
>  /*
>   * initialise the fs caching module
>   */
> @@ -52,6 +58,9 @@ static int __init cachefiles_init(void)
>  	ret = misc_register(&cachefiles_dev);
>  	if (ret < 0)
>  		goto error_dev;
> +	ret = misc_register(&cachefiles_demand_dev);
> +	if (ret < 0)
> +		goto error_demand_dev;
>  
>  	/* create an object jar */
>  	ret = -ENOMEM;
> @@ -68,6 +77,8 @@ static int __init cachefiles_init(void)
>  	return 0;
>  
>  error_object_jar:
> +	misc_deregister(&cachefiles_demand_dev);
> +error_demand_dev:
>  	misc_deregister(&cachefiles_dev);
>  error_dev:
>  	cachefiles_unregister_error_injection();
> @@ -86,6 +97,7 @@ static void __exit cachefiles_exit(void)
>  	pr_info("Unloading\n");
>  
>  	kmem_cache_destroy(cachefiles_object_jar);
> +	misc_deregister(&cachefiles_demand_dev);
>  	misc_deregister(&cachefiles_dev);
>  	cachefiles_unregister_error_injection();
>  }

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

