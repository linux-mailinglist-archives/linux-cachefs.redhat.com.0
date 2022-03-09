Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6292D4D3235
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 16:51:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646841115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SOUbD5lAslEB8NW5eOiKjxe5qPX9K9r7/3Npt8kw+qU=;
	b=O0k7NIOkRE1giKXJNcu8xJ+UZK8IIOcPwRIFd15q8X/S8rkRAhU0AhySIm+JMnbeeCzmzL
	SjAVGYJO1N0I8Wk0KWILVPan2OC00S1k+tj90RLEsys+sqKSI6L6qZFETKSJCtKQLwna7a
	8iCQ1iqNhY0zhuuGI4RgDVIJ7coc1Ds=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-MqtO8DkZPsKY2FAm-J5CYw-1; Wed, 09 Mar 2022 10:51:52 -0500
X-MC-Unique: MqtO8DkZPsKY2FAm-J5CYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 832A4296A60F;
	Wed,  9 Mar 2022 15:51:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52306401E4E;
	Wed,  9 Mar 2022 15:51:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 153F31953543;
	Wed,  9 Mar 2022 15:51:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B576194F4AE for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 15:30:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 45EF6401E64; Wed,  9 Mar 2022 15:30:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42081401E3B
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 15:30:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 288ED800B21
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 15:30:40 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Fl1IsN_PMBe8drd4cKRLqA-1; Wed, 09 Mar 2022 10:30:39 -0500
X-MC-Unique: Fl1IsN_PMBe8drd4cKRLqA-1
Received: by mail-qt1-f198.google.com with SMTP id
 o19-20020a05622a045300b002dd26442ed0so1808969qtx.20
 for <linux-cachefs@redhat.com>; Wed, 09 Mar 2022 07:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=6EsyJDNMaW7aLzLkycFQGvPjjJ3FlfDqU3pzS9T1Q8I=;
 b=0qTvyQLyJHQWXAqwSK/FHSjW2wryYY1eRJg02WfTJen2i52sZyDwjBLWbGpdc1ayhM
 j6GOAw/F2tc+hwoqwzi+hF2dUjbjcDJ6AbNKIa3UuB5QhAraemuVbWV22B8gNu2Af3Xu
 lOZzZzycF/HksP9HgQ6tbS/9MGycz/58wIkR55h+gdx8WKmo9dy8FTiQurYGgaBVc2rn
 6iDhM6UIFkXO/O4zX+34ixZR0maxg4Flj6ZrGiFIak/BJzDNYw6GnVWWMjO8Bo23mAc8
 Cv+jzsd0kXgXvypvpfGYOVPHHgopwS18yWEAyHgtmLUrEsaownA2bw8zBy2RpaQLcqXa
 TaWQ==
X-Gm-Message-State: AOAM533XoCxg1qH9NzlbLZOoAw8pTGRDjBAZJn8+hpK9u8JJvv5V+Ocq
 13RzdCLQhqgtTqlpUVqKHOIwpmKEw7eh04XldkoP0bkEBHH8YCR24brTEXFOfe3DbGM4O9CIN1p
 UiF6wwtrSM90Wh/GnG4G0Gg==
X-Received: by 2002:a05:622a:102:b0:2de:6596:73ff with SMTP id
 u2-20020a05622a010200b002de659673ffmr166624qtw.75.1646839838463; 
 Wed, 09 Mar 2022 07:30:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFSSJDdxTCAvhdcrcS/qlT4SNihglL15R3cIkJvlDoonZ+iPAI4r0UaiLtAuAoNBZeA0b9IA==
X-Received: by 2002:a05:622a:102:b0:2de:6596:73ff with SMTP id
 u2-20020a05622a010200b002de659673ffmr166596qtw.75.1646839838220; 
 Wed, 09 Mar 2022 07:30:38 -0800 (PST)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
 [68.20.15.154]) by smtp.gmail.com with ESMTPSA id
 x12-20020a05620a14ac00b0060deaee7a21sm1055813qkj.51.2022.03.09.07.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 07:30:37 -0800 (PST)
Message-ID: <c2f4b3dc107b106e04c48f54945a12715cccfdf3.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed, 09 Mar 2022 10:30:36 -0500
In-Reply-To: <164678192454.1200972.4428834328108580460.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678192454.1200972.4428834328108580460.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v2 02/19] netfs: Generate enums from
 trace symbol mapping lists
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-03-08 at 23:25 +0000, David Howells wrote:
> netfs has a number of lists of symbols for use in tracing, listed in an
> enum and then listed again in a symbol->string mapping for use with
> __print_symbolic().  This is, however, redundant.
> 
> Instead, use the symbol->string mapping list to also generate the enum
> where the enum is in the same file.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> 
> Link: https://lore.kernel.org/r/164622980839.3564931.5673300162465266909.stgit@warthog.procyon.org.uk/ # v1
> ---
> 
>  include/trace/events/netfs.h |   57 ++++++++++--------------------------------
>  1 file changed, 14 insertions(+), 43 deletions(-)
> 
> diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
> index e6f4ebbb4c69..88d9a74dd346 100644
> --- a/include/trace/events/netfs.h
> +++ b/include/trace/events/netfs.h
> @@ -15,49 +15,6 @@
>  /*
>   * Define enums for tracing information.
>   */
> -#ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
> -#define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
> -
> -enum netfs_read_trace {
> -	netfs_read_trace_expanded,
> -	netfs_read_trace_readahead,
> -	netfs_read_trace_readpage,
> -	netfs_read_trace_write_begin,
> -};
> -
> -enum netfs_rreq_trace {
> -	netfs_rreq_trace_assess,
> -	netfs_rreq_trace_done,
> -	netfs_rreq_trace_free,
> -	netfs_rreq_trace_resubmit,
> -	netfs_rreq_trace_unlock,
> -	netfs_rreq_trace_unmark,
> -	netfs_rreq_trace_write,
> -};
> -
> -enum netfs_sreq_trace {
> -	netfs_sreq_trace_download_instead,
> -	netfs_sreq_trace_free,
> -	netfs_sreq_trace_prepare,
> -	netfs_sreq_trace_resubmit_short,
> -	netfs_sreq_trace_submit,
> -	netfs_sreq_trace_terminated,
> -	netfs_sreq_trace_write,
> -	netfs_sreq_trace_write_skip,
> -	netfs_sreq_trace_write_term,
> -};
> -
> -enum netfs_failure {
> -	netfs_fail_check_write_begin,
> -	netfs_fail_copy_to_cache,
> -	netfs_fail_read,
> -	netfs_fail_short_readpage,
> -	netfs_fail_short_write_begin,
> -	netfs_fail_prepare_write,
> -};
> -
> -#endif
> -
>  #define netfs_read_traces					\
>  	EM(netfs_read_trace_expanded,		"EXPANDED ")	\
>  	EM(netfs_read_trace_readahead,		"READAHEAD")	\
> @@ -98,6 +55,20 @@ enum netfs_failure {
>  	EM(netfs_fail_short_write_begin,	"short-write-begin")	\
>  	E_(netfs_fail_prepare_write,		"prep-write")
>  
> +#ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
> +#define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
> +
> +#undef EM
> +#undef E_
> +#define EM(a, b) a,
> +#define E_(a, b) a
> +
> +enum netfs_read_trace { netfs_read_traces } __mode(byte);
> +enum netfs_rreq_trace { netfs_rreq_traces } __mode(byte);
> +enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
> +enum netfs_failure { netfs_failures } __mode(byte);
> +

Should you undef EM and E_ here after creating these?

> +#endif
>  
>  /*
>   * Export enum symbols via userspace.
> 
> 

Looks fine otherwise:

Acked-by: Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

