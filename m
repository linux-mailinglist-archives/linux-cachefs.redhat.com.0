Return-Path: <linux-cachefs+bncBC3PHRO5QEGBBSFA22WAMGQEK5XLSTQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ACB823184
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 17:50:18 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-680c651928esf25383476d6.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 08:50:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704300617; cv=pass;
        d=google.com; s=arc-20160816;
        b=dA7SJveVnbyKMx+mZcDofvAL5DF4lfPyw28c3QGo099r7wN06FSKmmmwe1gw6uTDlC
         oaw+yF0LCeGt/QmenHply2RGoXbYIrqMRffm/zb5zCGmFEesAxELpvr8VIkekCbqXhhI
         yZMbP3oQ8qSchQWCzNelT8vyuItqIB5fyuk8X/sIw5EJnrVvIH0LvQxXzcFJGQbysY6C
         0WW4fc6RX+ZaTbzgGpVm9XT7cqiulF3TyrDtz1J7IBrgWIYJOAHWss3C99XnYV98pfc+
         xKc2FW4C63lAdPN9wMpAbPpNxVpykn51nxwicNKI4bloWT7D7Vcd6Qcb16H+dtosI7l7
         dUOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :delivered-to;
        bh=Xq32SIw862Wrj4YT6BJt45mOneAVVzVDPEq+beXlLYE=;
        fh=Z1P1ivOoe1pDe6a8tHFddzm5JTlGAiVFZFhbv3JkP74=;
        b=dkghMf0lpj2TSOeG+phvko1O49MGjL89wdJ0yAYIiWHZq5C6zJCdYvNSD1LKY7a6RR
         Dead/JZ54htZQ2PPGPoef0CA8XzQrg5s/fktADeLPcPmjSCaXqpUUi9sXemzMCcZjKTc
         B4Z1+soo73cDSF2k2uwRy4YzDBSIPiBYFJeRA3o6Vq3g6IxJebORSlT2iNENbJ/o0NSd
         838w9XRl934p+V1vea38HqkAtHVOxy/A0NhPG60uWMam/ds6vfo7F7gpdUiPUqc1Rgvs
         AMtZBo51iDgktK2QR2uDYFfYyqbZe9fP08LYnBOvxiepQF5VcEN3ykP5cs+hmnohR/P1
         pZnQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of marc.c.dionne@gmail.com designates 209.85.208.50 as permitted sender) smtp.mailfrom=marc.c.dionne@gmail.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704300617; x=1704905417;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq32SIw862Wrj4YT6BJt45mOneAVVzVDPEq+beXlLYE=;
        b=KRnNWlVSNDjGlHxJ/OHkDSFgBdtjpBk5P/+bIQST2mP/zX1R9CnNkEl4p/yxt/Oxek
         4indqGJA+J8wEK1JQ2Xw9Z2kV2PdVOslYhKDMXx0aGpb+otvashbGGmI6VTgHaBGIyuG
         sspxJ3qt7+xAC7TjXRg9y/jOGPz6YBfa5j7ndIuDl15WfSOd2X86dz9gHws1Elb1SGDW
         emPsnTN3mfFjOQInSKT4BoVk3G4Xt92xCIqpMWS0DzzW1F6PvbQqplMQo5wHlV5PrDnR
         LeG7C6vidJXi/gDpSsQyBbECN2k/3uTE6M5/5Fu/qhMtA+D58IS796HTDPki5YEbz5K9
         WNmQ==
X-Gm-Message-State: AOJu0YypqGzNRSDi/eR8kHRUovJiOEvuk73g5wjJCDajdPZFO8eOPnwM
	JZpp8Mdsa7syh4FGfvHXEa3StY34SIj+Iw==
X-Google-Smtp-Source: AGHT+IGcqhe+JCMPAyWoQvKccM9D3jTPL/s8yjGs0CRHM+Smx9a6gwvRJreMKlTMx0a1IkBxv6k2mQ==
X-Received: by 2002:ad4:5749:0:b0:680:d1d2:2baf with SMTP id q9-20020ad45749000000b00680d1d22bafmr747919qvx.27.1704300616974;
        Wed, 03 Jan 2024 08:50:16 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:4113:b0:67f:4e7a:d81e with SMTP id
 kc19-20020a056214411300b0067f4e7ad81els778658qvb.2.-pod-prod-03-us; Wed, 03
 Jan 2024 08:50:16 -0800 (PST)
X-Received: by 2002:a05:620a:444e:b0:781:5c55:d7bf with SMTP id w14-20020a05620a444e00b007815c55d7bfmr15659824qkp.110.1704300616334;
        Wed, 03 Jan 2024 08:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704300616; cv=none;
        d=google.com; s=arc-20160816;
        b=ebZd1BBfWWyx1KNlnuWCChhmxyZe+ndni2yG7zc/MiXbLdNEv30+rDeDiREbXuxumb
         vAukx+/7gvjB5PbY1ChEl1e8Qh9jbhrNTroprawZTFwsyrSlJ2gAUtdKE4gGjESJ3QVn
         mOZFU8xtx9RgenXBZDI+6zMNR8GMNKQHloELpveBmilIbm0e7NJp279ktIBSN27WHoVf
         TafKsnuJ0/DI2wfJgk2Qghp9lzfpsjTxVaVJ/kJmi3QMCNdH0krOnIIV9ZUZSOv4qhZ8
         ACosDt0VHHgNJBQJ5eHhTY9Z58jbduaVbuEDey2rnASTwOSw7BP6c8Wr5pTwnzhTQxRS
         JkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:delivered-to;
        bh=KyxC65ZUHhJNVZLWmNzwaZSs3wWveWb1iIYNlwWiPu4=;
        fh=Z1P1ivOoe1pDe6a8tHFddzm5JTlGAiVFZFhbv3JkP74=;
        b=zK7HUzahMdQ5+i5EoRHP4TTrsbRiU0Xv/tF44ngrysN1DD7mOuH+xny5KtqhBDq4p7
         F/IbF6M/Vs1TNaSCGx/CPEdsuoY5PMg3JxELt3Ezws4JZmwO0f1Iu3tCP0ubSZXW4Pzw
         5P5br+igdFuLCcsS3ovnSB+Mj+LPQQSQcuG9mbn9Z0aTtk1ulm3EqIrUVCFdfeWztHaY
         8RqsCfSQtmrY4teOSN8Kvhkh/KjAXls5HLoOawyECCbM3FEtRZCejlvRrBR5tTY/TBC9
         QgzGl5dUayU/DI7MuGog6p4ZoPg6hdWctPfuXcNLPhWg2hC8RCkfeXQtVdKJBwijUS9s
         wQFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of marc.c.dionne@gmail.com designates 209.85.208.50 as permitted sender) smtp.mailfrom=marc.c.dionne@gmail.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id i3-20020a05620a248300b00781381609aesi26104421qkn.495.2024.01.03.08.50.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:50:16 -0800 (PST)
Received-SPF: pass (google.com: domain of marc.c.dionne@gmail.com designates 209.85.208.50 as permitted sender) client-ip=209.85.208.50;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-6d-LnH1qPWmj-q57HvJnyQ-1; Wed, 03 Jan 2024 11:50:14 -0500
X-MC-Unique: 6d-LnH1qPWmj-q57HvJnyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B203588B7A0
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 16:50:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id AEC1C2026D6F; Wed,  3 Jan 2024 16:50:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7AA22026D66
	for <linux-cachefs@redhat.com>; Wed,  3 Jan 2024 16:50:14 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EDAF85A58A
	for <linux-cachefs@redhat.com>; Wed,  3 Jan 2024 16:50:14 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-cdINcLJhPIKDWSiqKBEmtA-1; Wed, 03 Jan 2024 11:50:12 -0500
X-MC-Unique: cdINcLJhPIKDWSiqKBEmtA-1
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55590da560dso5216430a12.0;
        Wed, 03 Jan 2024 08:50:12 -0800 (PST)
X-Received: by 2002:a50:9fc6:0:b0:552:34d5:85a1 with SMTP id c64-20020a509fc6000000b0055234d585a1mr1117374edf.4.1704300610288;
        Wed, 03 Jan 2024 08:50:10 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id p2-20020a056402044200b005553a8bb61dsm10679067edw.87.2024.01.03.08.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 08:50:10 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a1915034144so1212224866b.0;
        Wed, 03 Jan 2024 08:50:09 -0800 (PST)
X-Received: by 2002:a17:907:2d9f:b0:a23:6230:6213 with SMTP id
 gt31-20020a1709072d9f00b00a2362306213mr11110657ejc.98.1704300609810; Wed, 03
 Jan 2024 08:50:09 -0800 (PST)
MIME-Version: 1.0
References: <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-7-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-7-dhowells@redhat.com>
From: "'Marc Dionne' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
Date: Wed, 3 Jan 2024 12:49:58 -0400
X-Gmail-Original-Message-ID: <CAB9dFdufPXLZJAKZbzSfsv4o=SzwKfeW4WGrAdFTmn6B0on63Q@mail.gmail.com>
Message-ID: <CAB9dFdufPXLZJAKZbzSfsv4o=SzwKfeW4WGrAdFTmn6B0on63Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/40] netfs, fscache: Move /proc/fs/fscache to
 /proc/fs/netfs and put in a symlink
To: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, Paulo Alcantara <pc@manguebit.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Ilya Dryomov <idryomov@gmail.com>, Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com, 
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: auristor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: marc.c.dionne@gmail.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of marc.c.dionne@gmail.com designates 209.85.208.50 as permitted
 sender) smtp.mailfrom=marc.c.dionne@gmail.com
X-Original-From: Marc Dionne <marc.dionne@auristor.com>
Reply-To: Marc Dionne <marc.dionne@auristor.com>
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

On Thu, Dec 21, 2023 at 9:24=E2=80=AFAM David Howells <dhowells@redhat.com>=
 wrote:
>
> Rename /proc/fs/fscache to "netfs" and make a symlink from fscache to tha=
t.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> cc: Christian Brauner <christian@brauner.io>
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-cachefs@redhat.com
> ---
>
> Notes:
>     Changes
>     =3D=3D=3D=3D=3D=3D=3D
>     ver #5)
>      - fscache_init/exit() should depend on CONFIG_FSCACHE, not CONFIG_PR=
OC_FS.
>
>  fs/netfs/fscache_main.c  |  8 ++------
>  fs/netfs/fscache_proc.c  | 23 ++++++++---------------
>  fs/netfs/fscache_stats.c |  4 +---
>  fs/netfs/internal.h      | 12 +++++++++++-
>  fs/netfs/main.c          | 33 +++++++++++++++++++++++++++++++++
>  fs/netfs/stats.c         | 13 +++++++------
>  include/linux/netfs.h    |  1 -
>  7 files changed, 62 insertions(+), 32 deletions(-)
>
> diff --git a/fs/netfs/fscache_main.c b/fs/netfs/fscache_main.c
> index 00600a4d9ce5..42e98bb523e3 100644
> --- a/fs/netfs/fscache_main.c
> +++ b/fs/netfs/fscache_main.c
> @@ -62,7 +62,7 @@ unsigned int fscache_hash(unsigned int salt, const void=
 *data, size_t len)
>  /*
>   * initialise the fs caching module
>   */
> -static int __init fscache_init(void)
> +int __init fscache_init(void)
>  {
>         int ret =3D -ENOMEM;
>
> @@ -94,12 +94,10 @@ static int __init fscache_init(void)
>         return ret;
>  }
>
> -fs_initcall(fscache_init);
> -
>  /*
>   * clean up on module removal
>   */
> -static void __exit fscache_exit(void)
> +void __exit fscache_exit(void)
>  {
>         _enter("");
>
> @@ -108,5 +106,3 @@ static void __exit fscache_exit(void)
>         destroy_workqueue(fscache_wq);
>         pr_notice("FS-Cache unloaded\n");
>  }
> -
> -module_exit(fscache_exit);
> diff --git a/fs/netfs/fscache_proc.c b/fs/netfs/fscache_proc.c
> index dc3b0e9c8cce..ecd0d1edafaa 100644
> --- a/fs/netfs/fscache_proc.c
> +++ b/fs/netfs/fscache_proc.c
> @@ -12,41 +12,34 @@
>  #include "internal.h"
>
>  /*
> - * initialise the /proc/fs/fscache/ directory
> + * Add files to /proc/fs/netfs/.
>   */
>  int __init fscache_proc_init(void)
>  {
> -       if (!proc_mkdir("fs/fscache", NULL))
> -               goto error_dir;
> +       if (!proc_symlink("fs/fscache", NULL, "../netfs"))

This should be just "netfs"

> +               goto error_sym;
>
> -       if (!proc_create_seq("fs/fscache/caches", S_IFREG | 0444, NULL,
> +       if (!proc_create_seq("fs/netfs/caches", S_IFREG | 0444, NULL,
>                              &fscache_caches_seq_ops))
>                 goto error;
>
> -       if (!proc_create_seq("fs/fscache/volumes", S_IFREG | 0444, NULL,
> +       if (!proc_create_seq("fs/netfs/volumes", S_IFREG | 0444, NULL,
>                              &fscache_volumes_seq_ops))
>                 goto error;
>
> -       if (!proc_create_seq("fs/fscache/cookies", S_IFREG | 0444, NULL,
> +       if (!proc_create_seq("fs/netfs/cookies", S_IFREG | 0444, NULL,
>                              &fscache_cookies_seq_ops))
>                 goto error;
> -
> -#ifdef CONFIG_FSCACHE_STATS
> -       if (!proc_create_single("fs/fscache/stats", S_IFREG | 0444, NULL,
> -                               fscache_stats_show))
> -               goto error;
> -#endif
> -
>         return 0;
>
>  error:
>         remove_proc_entry("fs/fscache", NULL);
> -error_dir:
> +error_sym:
>         return -ENOMEM;
>  }
>
>  /*
> - * clean up the /proc/fs/fscache/ directory
> + * Clean up the /proc/fs/fscache symlink.
>   */
>  void fscache_proc_cleanup(void)
>  {
> diff --git a/fs/netfs/fscache_stats.c b/fs/netfs/fscache_stats.c
> index fc94e5e79f1c..aad812ead398 100644
> --- a/fs/netfs/fscache_stats.c
> +++ b/fs/netfs/fscache_stats.c
> @@ -52,7 +52,7 @@ EXPORT_SYMBOL(fscache_n_culled);
>  /*
>   * display the general statistics
>   */
> -int fscache_stats_show(struct seq_file *m, void *v)
> +int fscache_stats_show(struct seq_file *m)
>  {
>         seq_puts(m, "FS-Cache statistics\n");
>         seq_printf(m, "Cookies: n=3D%d v=3D%d vcol=3D%u voom=3D%u\n",
> @@ -96,7 +96,5 @@ int fscache_stats_show(struct seq_file *m, void *v)
>         seq_printf(m, "IO     : rd=3D%u wr=3D%u\n",
>                    atomic_read(&fscache_n_read),
>                    atomic_read(&fscache_n_write));
> -
> -       netfs_stats_show(m);
>         return 0;
>  }
> diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
> index 43769ac606e8..3f6e22229433 100644
> --- a/fs/netfs/internal.h
> +++ b/fs/netfs/internal.h
> @@ -76,6 +76,7 @@ extern atomic_t netfs_n_rh_write_done;
>  extern atomic_t netfs_n_rh_write_failed;
>  extern atomic_t netfs_n_rh_write_zskip;
>
> +int netfs_stats_show(struct seq_file *m, void *v);
>
>  static inline void netfs_stat(atomic_t *stat)
>  {
> @@ -166,6 +167,13 @@ static inline void fscache_see_cookie(struct fscache=
_cookie *cookie,
>   * fscache-main.c
>   */
>  extern unsigned int fscache_hash(unsigned int salt, const void *data, si=
ze_t len);
> +#ifdef CONFIG_FSCACHE
> +int __init fscache_init(void);
> +void __exit fscache_exit(void);
> +#else
> +static inline int fscache_init(void) { return 0; }
> +static inline void fscache_exit(void) {}
> +#endif
>
>  /*
>   * fscache-proc.c
> @@ -216,12 +224,14 @@ static inline void fscache_stat_d(atomic_t *stat)
>
>  #define __fscache_stat(stat) (stat)
>
> -int fscache_stats_show(struct seq_file *m, void *v);
> +int fscache_stats_show(struct seq_file *m);
>  #else
>
>  #define __fscache_stat(stat) (NULL)
>  #define fscache_stat(stat) do {} while (0)
>  #define fscache_stat_d(stat) do {} while (0)
> +
> +static inline int fscache_stats_show(struct seq_file *m) { return 0; }
>  #endif
>
>  /*
> diff --git a/fs/netfs/main.c b/fs/netfs/main.c
> index 1ba8091fcf3e..c9af6e0896d3 100644
> --- a/fs/netfs/main.c
> +++ b/fs/netfs/main.c
> @@ -7,6 +7,8 @@
>
>  #include <linux/module.h>
>  #include <linux/export.h>
> +#include <linux/proc_fs.h>
> +#include <linux/seq_file.h>
>  #include "internal.h"
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/netfs.h>
> @@ -19,3 +21,34 @@ unsigned netfs_debug;
>  module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
>  MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
>
> +static int __init netfs_init(void)
> +{
> +       int ret =3D -ENOMEM;
> +
> +       if (!proc_mkdir("fs/netfs", NULL))
> +               goto error;
> +
> +#ifdef CONFIG_FSCACHE_STATS
> +       if (!proc_create_single("fs/netfs/stats", S_IFREG | 0444, NULL,
> +                               netfs_stats_show))
> +               goto error_proc;
> +#endif
> +
> +       ret =3D fscache_init();
> +       if (ret < 0)
> +               goto error_proc;
> +       return 0;
> +
> +error_proc:
> +       remove_proc_entry("fs/netfs", NULL);
> +error:
> +       return ret;
> +}
> +fs_initcall(netfs_init);
> +
> +static void __exit netfs_exit(void)
> +{
> +       fscache_exit();
> +       remove_proc_entry("fs/netfs", NULL);
> +}
> +module_exit(netfs_exit);
> diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
> index 5510a7a14a40..6025dc485f7e 100644
> --- a/fs/netfs/stats.c
> +++ b/fs/netfs/stats.c
> @@ -28,31 +28,32 @@ atomic_t netfs_n_rh_write_done;
>  atomic_t netfs_n_rh_write_failed;
>  atomic_t netfs_n_rh_write_zskip;
>
> -void netfs_stats_show(struct seq_file *m)
> +int netfs_stats_show(struct seq_file *m, void *v)
>  {
> -       seq_printf(m, "RdHelp : RA=3D%u RP=3D%u WB=3D%u WBZ=3D%u rr=3D%u =
sr=3D%u\n",
> +       seq_printf(m, "Netfs  : RA=3D%u RP=3D%u WB=3D%u WBZ=3D%u rr=3D%u =
sr=3D%u\n",
>                    atomic_read(&netfs_n_rh_readahead),
>                    atomic_read(&netfs_n_rh_readpage),
>                    atomic_read(&netfs_n_rh_write_begin),
>                    atomic_read(&netfs_n_rh_write_zskip),
>                    atomic_read(&netfs_n_rh_rreq),
>                    atomic_read(&netfs_n_rh_sreq));
> -       seq_printf(m, "RdHelp : ZR=3D%u sh=3D%u sk=3D%u\n",
> +       seq_printf(m, "Netfs  : ZR=3D%u sh=3D%u sk=3D%u\n",
>                    atomic_read(&netfs_n_rh_zero),
>                    atomic_read(&netfs_n_rh_short_read),
>                    atomic_read(&netfs_n_rh_write_zskip));
> -       seq_printf(m, "RdHelp : DL=3D%u ds=3D%u df=3D%u di=3D%u\n",
> +       seq_printf(m, "Netfs  : DL=3D%u ds=3D%u df=3D%u di=3D%u\n",
>                    atomic_read(&netfs_n_rh_download),
>                    atomic_read(&netfs_n_rh_download_done),
>                    atomic_read(&netfs_n_rh_download_failed),
>                    atomic_read(&netfs_n_rh_download_instead));
> -       seq_printf(m, "RdHelp : RD=3D%u rs=3D%u rf=3D%u\n",
> +       seq_printf(m, "Netfs  : RD=3D%u rs=3D%u rf=3D%u\n",
>                    atomic_read(&netfs_n_rh_read),
>                    atomic_read(&netfs_n_rh_read_done),
>                    atomic_read(&netfs_n_rh_read_failed));
> -       seq_printf(m, "RdHelp : WR=3D%u ws=3D%u wf=3D%u\n",
> +       seq_printf(m, "Netfs  : WR=3D%u ws=3D%u wf=3D%u\n",
>                    atomic_read(&netfs_n_rh_write),
>                    atomic_read(&netfs_n_rh_write_done),
>                    atomic_read(&netfs_n_rh_write_failed));
> +       return fscache_stats_show(m);
>  }
>  EXPORT_SYMBOL(netfs_stats_show);
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index d294ff8f9ae4..9bd91cd615d5 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -294,7 +294,6 @@ void netfs_get_subrequest(struct netfs_io_subrequest =
*subreq,
>                           enum netfs_sreq_ref_trace what);
>  void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
>                           bool was_async, enum netfs_sreq_ref_trace what)=
;
> -void netfs_stats_show(struct seq_file *);
>  ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
>                                 struct iov_iter *new,
>                                 iov_iter_extraction_t extraction_flags);
>

Marc

--=20
You received this message because you are subscribed to the Google Groups "=
linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.

