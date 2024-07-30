Return-Path: <linux-cachefs+bncBDLIXLMFVAERBHUTUS2QMGQE4L5VLRI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B459941591
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Jul 2024 17:41:20 +0200 (CEST)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5d0fecd1981sf1291336eaf.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Jul 2024 08:41:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722354079; cv=pass;
        d=google.com; s=arc-20160816;
        b=JYsvao6xhfrq6v4TOdX4C5OEU8LQBtdC4EV8jKyqC2NHkt3Aa8l46adBRG8VZrl/5Z
         yhGvyT+xOcPRJxS+v4YjJVuNhcEQ0cAcwR2xp0wVoNv07KWsRhLn5FkteHTm5pZoesEQ
         F27NQLmCPgAWYQKSqV+yz9wo6d8wi3UDsmDLk3pnhDvQuYO0u7+thu/Hjm84qItM37/F
         pZJ6L4lhxV0utlK2hBzeOcqOQMDQfFACY2HMI4FvtF9pvkWJRH2VHubca9zLqVlVwJz+
         JPx4PSffZQIk2UolN72d1SlT7ImEsWhxlvXj274SIC3z3Ppb6/JZhEZx4tOxxpOY9c6m
         e1Ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=D5hvVnf12IFXF2bz3MJXnis0O/86kZLjr+oOvYVK9CU=;
        fh=CCxJrtp9/k8Gf4Iler6hUAMFTmYNKsEOGBLFHcr6nb0=;
        b=O77rGX2zbZWlkSfcjDIhcCF/WLcUmH3ahRuHH0FeQ1sgN4tMpczqCLG60jOr9o1wu+
         025EtD4VCEWoo8gQz5AyNgH9GyfwbNevsNea8CYWa5GWC2mud+Uhn5JLLqHy9BRcDtUM
         etmtmPjRJl9btjPJdZ0AJBaq+49hEOiNU7kjki7pWBEM6gmZdNEAaQLtQ1PBRYNtzNlx
         b2K5Rgq2KntDKGGKBLJUhXqgi+6YYARDMpiRVIS26tUR8G7pA8vomzpOVNh1K5y0kiLF
         JhDaUVTKZhFRhAREE08/KzVj4hyKUoxFiFCnEODk0AAkRt/7ERUf+bR6yfZNF+DrdsmQ
         yqtA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354079; x=1722958879;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D5hvVnf12IFXF2bz3MJXnis0O/86kZLjr+oOvYVK9CU=;
        b=tvo6HcMQtNNwW6LaBdVJhFIj1EV4wYXWtzlvb4yIsekd3hJbTmAsO4zjpGaq4cT3eV
         WPTNMwBkz3uaBQanSLd6ADojUc7oS4DI7pEDhksq9RE2NbEfNJ8VgW0mnSFFbHQM1OqI
         aCAAQZCmE7lCNllbx4ULRVd4gcEvmOnQXx3fx78d6GRwS6BQewKpjNTG5HNnM4zdx+BU
         5AFOJ1qMXmpqGVzGF4S1eOi9WhrAGZtYMchNYedVSbcJnKam0eW1yBlceQcJmbPXiL/5
         cjE67fG8GVn8CQtN0h63Md2c6v0AaB2lk3a/yL+ftT7tFT4nCfwrZt7AhVhrYEXGD3CF
         71/A==
X-Forwarded-Encrypted: i=2; AJvYcCWsal583AoWs17FqdMd4b1NZKemLSwLgvyGaflTNwJNV1xhA/x2Zx6yfxh+5PmX4hf9H8ZsTq++g0h50RxTr6K5e0wok4rISG1fk4Q=
X-Gm-Message-State: AOJu0Yx3h6VH+k1BWb1GnCIrJzcQhvmwq4OIDewLGbPvsZGobldxisas
	v1VQlGofDfe9lnCPS+A5fsA87i0U1KzjPB2rqzo1vd1b0bAm2ACXWTGOFf+afnw=
X-Google-Smtp-Source: AGHT+IHay+LHNlIFwOKEpD5smFs6C2YTIvtpgd5ZKAyHw/EY/vkFpQKTpjioavuUMXvi5blrLeR52g==
X-Received: by 2002:a05:6870:e2cd:b0:25e:dce:491b with SMTP id 586e51a60fabf-264a357269dmr10978691fac.1.1722354079106;
        Tue, 30 Jul 2024 08:41:19 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:7a07:b0:25e:160c:c90 with SMTP id
 586e51a60fabf-2649fefe7a4ls1009021fac.2.-pod-prod-08-us; Tue, 30 Jul 2024
 08:41:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaWJrnhvxkaOGYBLYPTwLPDmk8JiGYrmckl8k/TGJgicSLBQgpPK/Amb/ib7CfS4fFDIfNQvI6Di2RBxGBbz+JjmjS8H3QWS6Z6zbAmII=
X-Received: by 2002:a05:6358:705:b0:1aa:bde7:5725 with SMTP id e5c5f4694b2df-1adce43c3a9mr1560403755d.28.1722354078414;
        Tue, 30 Jul 2024 08:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722354078; cv=none;
        d=google.com; s=arc-20160816;
        b=TDwz1lG5pKylWxMBTYi4ENlcpowJo9L/nmk9DgAGYfeATxFloGbUTE1PWnXkzFcD9J
         zA21N5rpFLqykc2xQlAUGLFthCnwN6PjeyGHeCo9b13Kqboq5A7ybOiYUNwBgH3kfef1
         9golLC9GupN5igq6XvFfl2Cy5K8mTl5QMqrtw/wf765r9FlxtzmqgfwFR0Ou2SdlG4uj
         sXy7ZiLKW1u1JERfkxTdvJapkQq+Zu+bQ/mjfYxgGxhfCVKPpfWJ2MeKT5URMjOlbCMM
         4Qlwi0s60Ii8wbRORcxfgyKGNvpWaVrgMZnnIkdZR6NpSCapzcEpBQWNGUp8oXqtCTch
         QYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=0mB5yq5YiVF6hgMMbOMHQ2v9K7FPCMyb/XiuYsldEd0=;
        fh=4o1FoawZ3FEDm3jfBtv8yJo5tNsD5YW7NfYuUjYO4HE=;
        b=kdxFXc6bAD4TYOaJ8vMA5gampTyrxpF0/2EelaGCHd8XlQJfGF/eUrMUKHgcbdrtEi
         K4E1xx+VIuateieGOoVW3y92IgH4I31479iB3OzktclH8kIznPEi1nJgqBDrGCh26EAE
         Q1QKzNGsdwdWCvMhuVggK19gIi04ii0j/XcO4g/qwpiRp42jqaUL+bBGjaqKiFvoisSQ
         jSM2eqQnTYy86rZ4f/1S6oV9ZW0gArICdxwrC2uOympR2rWnePnJAMQgldhVmL7gAj14
         9GK60xVAz2/Jt0zuEgeMQQ3ca6pI4EW3GT7bzqMz9zBf0rUaSTdDfwkvIk1uIDltKzZt
         r5nA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fb2675dsi135233706d6.606.2024.07.30.08.41.18
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-K1fCnDQvM-ClNJJGW020VQ-1; Tue,
 30 Jul 2024 11:41:16 -0400
X-MC-Unique: K1fCnDQvM-ClNJJGW020VQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 094AB1955D50
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Jul 2024 15:41:16 +0000 (UTC)
Received: by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id EBDBF1955D45; Tue, 30 Jul 2024 15:41:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E59D1955D42;
	Tue, 30 Jul 2024 15:41:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3516608.1722349609@warthog.procyon.org.uk>
References: <3516608.1722349609@warthog.procyon.org.uk> <20240729090639.852732-1-max.kellermann@ionos.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: dhowells@redhat.com, jlayton@kernel.org, willy@infradead.org,
    linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
    ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
    stable@vger.kernel.org
Subject: Re: [PATCH] fs/ceph/addr: pass using_pgpriv2=false to fscache_write_to_cache()
MIME-Version: 1.0
Date: Tue, 30 Jul 2024 16:41:12 +0100
Message-ID: <3554544.1722354072@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3554543.1722354072.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

I think the right thing to do is probably to at least partially revert:

	ae678317b95e760607c7b20b97c9cd4ca9ed6e1a
	netfs: Remove deprecated use of PG_private_2 as a second writeback flag

for the moment.  That removed the bit that actually did the write to the
cache on behalf of ceph.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

