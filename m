Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLV236WQMGQEOUTP2JY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A4840E36
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Jan 2024 18:15:28 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42a9d572178sf36972231cf.0
        for <lists+linux-cachefs@lfdr.de>; Mon, 29 Jan 2024 09:15:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706548527; cv=pass;
        d=google.com; s=arc-20160816;
        b=MhQiezzv4WDhtIunLW1fFsbPC0hntioNQwKzsaR1uTRN//XzvPND6GO9DRxnW0S9F1
         uEX4lmo1X2ridKvHAQCQziFUE6M34/Tx6y1G2C3rlpO/OuRCMprnz0m53VsaE3ldcImj
         qrvlVRL0CPFV9SF8ipc97Y2cfrDaUz6/lJ2zqOhRkBPJkzMYbuZH+MjDVDKbUMGVd4TZ
         d0w3rwZqLsfB1enE96Q/QNMbgHZqhbXIaYKws0Dam7T2c5JolzMA/P5xoVD1a4erjIOZ
         L1AcQNYo8g9sPtZTJNDKr5lF8ryI1UMvTs0eERp0pE88azAYd+I7dB9M0lzM6ujZbdg9
         Y9zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=PPfzWk5IsS3Vb6wirVCAPTPfteubQIo0i0RUo+PuYTg=;
        fh=A0S/2CCJLgGfcAb5MRNOjq7CyhN10FSX8gyzVDvsxIs=;
        b=FpQmzAB07ZY4GEOasn9VAeq9NHWhktA3YOfiDJd/ztBMnNlG3VvGEBSFt6T9UZYZux
         Q8Zrl4jUwKnJMl8D0rwzD06eZtYA+y3nqkeW5AAseM00JlgJUK2FtLlRWhlfQ6yKIYCs
         bXw8BN9R7xIlR8Ms7HHmDcY7O5/5Xh335EvmfA7YcHEbov5AMawEkavDQ296cleCrEiP
         77cR8mssqX9cr8ZWvJ4iBsJXhq/H28gvy5lHhCeBZvbS5McbsN4EViRrUikcW6Oe9YMP
         z5/5aAuCjNdr7yhsiKXy1aEdkZpMzVjJLboRmfxT2mlcf8lulepSyzkBV1Se7bsiccEr
         IzNA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548527; x=1707153327;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PPfzWk5IsS3Vb6wirVCAPTPfteubQIo0i0RUo+PuYTg=;
        b=TH+UjebQNVZVDKG7hQ3JfA3DFzxxMT7Y8bsDAgLi9tY1Girm/9gS6R2O/5oFamvyiM
         x7FldTzFlGrCrG5zlqJgS9yXxahA4PnuFfzrgV7hFcTCdi2PIognlT5huWWDh6A7cUFd
         tOQd5Q/PzCl7vCWSE4dbK4p9Sv/EJByB4sUeF83F4LG4AJSw1opESbkN4oQ7QLv6TuEa
         iBP3jY2QKPDsftWt/QoqMwIcjTWfpRQWmVU/kZOUxRVZSIXhwSQtokJ5FteYJ+6Aj+7b
         oac2W90L5YQlwid7Lox4OXzx4c6V3OcC3lW5Y6O/YQvCX48++qr2LfvsrvP219iDBkVs
         WWgg==
X-Gm-Message-State: AOJu0YxX++i/mZxaAgHuNUPWEec6tyyqkXM6hqQnzNwLkfpxSWAbk2VM
	Pk8ZS2w/tTxtOw51yAqOipJnywcPt+XbjwX3qPSmifMWlwVtUKP9IzNKfSfSGvM=
X-Google-Smtp-Source: AGHT+IFfhaNagZri4o9DPnvWZg+fdp6cSmWBA8lJzc6jdiBkQ2j5pDsSMOp5rA4vF/u+mnHbeq4O7g==
X-Received: by 2002:ac8:5c4e:0:b0:42a:b1b0:897f with SMTP id j14-20020ac85c4e000000b0042ab1b0897fmr343822qtj.32.1706548526881;
        Mon, 29 Jan 2024 09:15:26 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a03:b0:42a:97f6:db8d with SMTP id
 f3-20020a05622a1a0300b0042a97f6db8dls4358759qtb.2.-pod-prod-06-us; Mon, 29
 Jan 2024 09:15:26 -0800 (PST)
X-Received: by 2002:ac8:7d41:0:b0:42a:6df3:1f3f with SMTP id h1-20020ac87d41000000b0042a6df31f3fmr6550854qtb.60.1706548526135;
        Mon, 29 Jan 2024 09:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706548526; cv=none;
        d=google.com; s=arc-20160816;
        b=JE//lNndSNHGiUnc9O7GtUHw+ZYlRzN+9b7po7jzKRe+YbN7kWbGR82wjkM/jX7bKo
         74z9slHWqP6/YisY/yUdqhRUHRPOj0F/0w9v9uL2TyGyEb/YMVYl3c9qJ4u4NsqSlC5L
         se1tzqG0iKH9bQzmQbNXCPk+YlYLt5ZBmVUQSwVAqOIJHdU6oybxS9w1Vq8Nw8FrbHww
         JhAFiPojqVWZzYHlrM1CtkKoYJpUsZMw7ciWImPpYTH+iLUHVU/jK15axKfVQ4HCwzlj
         T55af0mlxL0CXka1MNOaRzYiMY1AA5zNWCYe1pk7yaVMTCx78QvHXEa0zvyaS2Vdw92Q
         7TPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=bQuAQGhRowVFdmmhoNiLQ1TQFCaXCXcXk9/7Zurpy6M=;
        fh=A0S/2CCJLgGfcAb5MRNOjq7CyhN10FSX8gyzVDvsxIs=;
        b=B2VMtR9O+7lPKkuClb+0Yk6+X0GPlZ48t5AT2AYvIWnAZ3oH+PqzNOqMclIKWIpJVm
         qSdZWseQNiU4DMnXdU9+VPQ6GAtmoxKLi5Cq1EFh/1J6TZUR1QUuUCoNNsvMbm11f3Sh
         vFirxIhWPsJTJt/4cMIgLNPejIh1whifK1kw+B8iA3jCW9aO86M39duuGZjGKKyFZiQw
         Eqk4RyIxsjG8TRzYVTnXiPHh4TUPeaYXFNI/8WnPpGx9LKXxoR4Ta2avz+8pQpMnfYpn
         wquKsVcqSLKIL/c9feMZmaSvIkvEqlVNOvn7h6/l02AlwaEOIX+NMPhVjdK3snUlAr9g
         9+KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g4-20020ac87d04000000b0042a4a0c231fsi8023083qtb.424.2024.01.29.09.15.25
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:15:26 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-bWRpn9PPNT-ICCsSYGIqUA-1; Mon, 29 Jan 2024 12:15:23 -0500
X-MC-Unique: bWRpn9PPNT-ICCsSYGIqUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 829EA85A588
	for <linux-cachefs@gapps.redhat.com>; Mon, 29 Jan 2024 17:15:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8003E2166B35; Mon, 29 Jan 2024 17:15:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98E4E2166B31;
	Mon, 29 Jan 2024 17:15:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240129154750.1245317-1-dwysocha@redhat.com>
References: <20240129154750.1245317-1-dwysocha@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>
Cc: dhowells@redhat.com, Anna Schumaker <anna.schumaker@netapp.com>,
    Trond Myklebust <trond.myklebust@hammerspace.com>,
    Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org,
    linux-cachefs@redhat.com
Subject: Re: [PATCH] NFS: Fix nfs_netfs_issue_read() xarray locking for writeback interrupt
MIME-Version: 1.0
Date: Mon, 29 Jan 2024 17:15:21 +0000
Message-ID: <1526807.1706548521@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1526806.1706548521.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

Dave Wysochanski <dwysocha@redhat.com> wrote:

> -	xas_lock(&xas);
> +	xas_lock_irqsave(&xas, flags);
>  	xas_for_each(&xas, page, last) {

You probably want to use RCU, not xas_lock().  The pages are locked and so
cannot be evicted from the xarray.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

