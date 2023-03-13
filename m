Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8566B746C
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Mar 2023 11:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678704181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k6j3uzSx8FbzI/41f5B7uqzENSgFZgNf+ajEl3bbdEs=;
	b=L0gJsKs2FG/5XPcANwn495/hPXStqdkHIEw4ISeVwhCxXAr0umexgn9XVtIHufOd/8dwmz
	A+cQYzMgmutdHFoChYXUHe71RLIKRVru9oik1BLh4lvM1Epsq6E9/cuxuVq2ZHufUawaQJ
	z3fe3lcGQ3XDcmeIAK5TkEpjgOZcdb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-seAu5o60Pq2ldTeE5JjvJA-1; Mon, 13 Mar 2023 06:42:58 -0400
X-MC-Unique: seAu5o60Pq2ldTeE5JjvJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3985885CBE2;
	Mon, 13 Mar 2023 10:42:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E06B640C6E67;
	Mon, 13 Mar 2023 10:42:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DBEE619465A3;
	Mon, 13 Mar 2023 10:42:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A33501946588 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 13 Mar 2023 10:42:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 92C3F2A68; Mon, 13 Mar 2023 10:42:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C00B1731B
 for <linux-cachefs@redhat.com>; Mon, 13 Mar 2023 10:42:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BD68811E6E
 for <linux-cachefs@redhat.com>; Mon, 13 Mar 2023 10:42:53 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177--2lGrjtaNL-HlXvzzrrqtg-1; Mon,
 13 Mar 2023 06:42:51 -0400
X-MC-Unique: -2lGrjtaNL-HlXvzzrrqtg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8DEB722A3B;
 Mon, 13 Mar 2023 10:32:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D1FB139F9;
 Mon, 13 Mar 2023 10:32:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U2j0Hcz7DmQsQgAAMHmgww
 (envelope-from <jack@suse.cz>); Mon, 13 Mar 2023 10:32:44 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 018BCA06FD; Mon, 13 Mar 2023 11:32:43 +0100 (CET)
Date: Mon, 13 Mar 2023 11:32:43 +0100
From: Jan Kara <jack@suse.cz>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20230313103243.ubn3mw3nkkcdyi5c@quack3>
References: <20230310231206.3952808-1-mcgrof@kernel.org>
 <20230310231206.3952808-4-mcgrof@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230310231206.3952808-4-mcgrof@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH 3/5] quota: simplify two-level sysctl
 registration for fs_dqstats_table
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
Cc: j.granados@samsung.com, jaharkes@cs.cmu.edu, keescook@chromium.org,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, codalist@coda.cs.cmu.edu, coda@cs.cmu.edu,
 linux-cachefs@redhat.com, ebiederm@xmission.com, jack@suse.com,
 linux-fsdevel@vger.kernel.org, yzaikin@google.com, anton@tuxera.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri 10-03-23 15:12:04, Luis Chamberlain wrote:
> There is no need to declare two tables to just create directories,
> this can be easily be done with a prefix path with register_sysctl().
> 
> Simplify this registration.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Thanks. I've taken the patch into my tree.

								Honza

> ---
>  fs/quota/dquot.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
> index a6357f728034..90cb70c82012 100644
> --- a/fs/quota/dquot.c
> +++ b/fs/quota/dquot.c
> @@ -2948,24 +2948,6 @@ static struct ctl_table fs_dqstats_table[] = {
>  	{ },
>  };
>  
> -static struct ctl_table fs_table[] = {
> -	{
> -		.procname	= "quota",
> -		.mode		= 0555,
> -		.child		= fs_dqstats_table,
> -	},
> -	{ },
> -};
> -
> -static struct ctl_table sys_table[] = {
> -	{
> -		.procname	= "fs",
> -		.mode		= 0555,
> -		.child		= fs_table,
> -	},
> -	{ },
> -};
> -
>  static int __init dquot_init(void)
>  {
>  	int i, ret;
> @@ -2973,7 +2955,7 @@ static int __init dquot_init(void)
>  
>  	printk(KERN_NOTICE "VFS: Disk quotas %s\n", __DQUOT_VERSION__);
>  
> -	register_sysctl_table(sys_table);
> +	register_sysctl("fs/quota", fs_dqstats_table);
>  
>  	dquot_cachep = kmem_cache_create("dquot",
>  			sizeof(struct dquot), sizeof(unsigned long) * 4,
> -- 
> 2.39.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

