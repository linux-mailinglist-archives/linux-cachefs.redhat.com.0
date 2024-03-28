Return-Path: <linux-cachefs+bncBDLIXLMFVAERBXFZS2YAMGQEER26VOY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE3890581
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:37:49 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-696ac7aec1dsf11336326d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:37:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643869; cv=pass;
        d=google.com; s=arc-20160816;
        b=uJGvgTffyLLPf4P0hYXP8mL0XxwJeTNIylsC2GLHlQfTguOyYiNMxASPTBeBi+Xlfx
         IKrbeSPNkOS6zdYoChLWKC1BgLMhgufncZoZwjheo4t59FLRgiANNqOItcSv/8A/sPE3
         VeksigurplRWtEALcDEtoSl3acRVS3U/Tb5X8mFp2JfvZBHjHKopttdkhkRoOoUQ104u
         NO9rS0v/R8gpIGdPqTjFUfSKy7UDKOgoz6Ib25K5x/mIXqgkwGKpzjP+GbZeYBbCpuqR
         f5pVLgh+/qmjTmx+ulXMp7ocSC1Q+ui58gEgx5495q3HBm8OLwKM9j0JluxzgvGF5sz4
         MvMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=8KkKEJe76THkK1F0AJeRTGYGK8z5lOAVoKqrTiByUUo=;
        fh=zuT+UFOX0ndR+U4TSSdcSEBbnfTm0cYj0YTN8MQ51fA=;
        b=Q41T4K2vywj3PnxHk/3buc5Duw30ptVdFQzHNpqqyzAa0OmNljp7QZ31UvaOFVeWWF
         zgnz4zW1gbwLiRp2SiwvN98gITswQFEkpKmmR7avoHjl74tncgasS3fO6DPd941Me01a
         J/HVHNm5mkmfrQJrd5kBGaXC+xntQ3TNiDkqk5XDuwbcYZCEmGM9X6GYAEOJX+MLWqIO
         AO40zghlWQbd0+M10mSa587OO9ueOuYec7y7aypR5LQja7QguXLCa297qeVR7BFavT+C
         kzkVkPMXN/EUKFR/ZXw5J3OKIERz+rNjSBwVT1bhFvrBT0ig7+UalTjscB4vRJzvesAF
         yFPw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643869; x=1712248669;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KkKEJe76THkK1F0AJeRTGYGK8z5lOAVoKqrTiByUUo=;
        b=js68tLGkaYzC/9i3P2TxHBpFgHgCETJGGuWyrc3PqJeKOnM+NAn/WEbJnUek+keOPB
         e7AHS+rk4e322YkRawrL0QKVzf08aW3Be+b4vw6C28SqK8ihFkcCZJsl8k0eK1wDExi2
         PNbN9Ng0ScOHihtQqUHUmpfCfYeLTjPdpnLe89WkJb+thXdQ3z+T6X/OO8JlGGFrdJrx
         kH1kWrq1wJAXwOecydMTchYhUcAI13jK8O3c8uREu6xIydCUSJuGKangGF4kbLiFywle
         Yq/NTewcxFeodRrQ1mgxGvTQzy0zkS22E4/vnK345gtyXjz7Y+OwbMbNNxnOTVu721rJ
         1kDw==
X-Forwarded-Encrypted: i=2; AJvYcCU/bbdKLMaMSDcmrTz3yxigbFZ4AEICEOuSC8JRh5kvPd4yHBEmAl3PkEdoWv4O7d/4ZzgbI6Pd/v3ibSNUmpFYSRK4sAnTgZmWeIE=
X-Gm-Message-State: AOJu0YzA0T/auCoE3vo9MMlUb1vehPtLjSvzCPcSG7nPfi/AAQo7jCo3
	SX+e5ny0hgEE2srghAokWTguN11sSD6rPYckapfnNYCwIfejGbXVATFIvxK1VJY=
X-Google-Smtp-Source: AGHT+IHQjpNV2GzIf+EyH5m3zsfaFUmiOiBZZaQv+oM9+LIJzIAzfkGt2lHJ1qg33BV2zHH7/Xfe3g==
X-Received: by 2002:a0c:ac4b:0:b0:696:74e6:3f25 with SMTP id m11-20020a0cac4b000000b0069674e63f25mr3005023qvb.40.1711643868878;
        Thu, 28 Mar 2024 09:37:48 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1d03:b0:698:ecf4:6ea5 with SMTP id
 e3-20020a0562141d0300b00698ecf46ea5ls23876qvd.2.-pod-prod-06-us; Thu, 28 Mar
 2024 09:37:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXX8GEavGyyzmO89izTDWzrM8kiMOs9C7qwjtctBmdESmbxDGV1/cBP6HPWgm7ioj4GInHQVrJHy4PE57yHubtE5F1YgooDcFKms0BZPzI=
X-Received: by 2002:a05:620a:1276:b0:78a:3ece:c4a4 with SMTP id b22-20020a05620a127600b0078a3ecec4a4mr3178591qkl.77.1711643868192;
        Thu, 28 Mar 2024 09:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643868; cv=none;
        d=google.com; s=arc-20160816;
        b=azv7MEHyBnRbKBLLM9/HbTtS0F33EMPugQ/DlsL0satIEWy9yXk4bJewEc7UHYXPMG
         LrQDDl0gKxcu6q1omFD4yNKSzHef8XmSn5PbGnbPVmTSH1ZrgfBdwXKXStSvLjt3FY12
         u1VPP/dq79Te2I09WyzGMgZy/SlrO0X74BzZOGWc/mc/tcpUrCeK8BdL6jrz0PF481tF
         azhR5OoYj7KMWQd1elZRcCcYjQ7EDlVurlQ1omRzTHsvCufHDxbrLvr6BMcdeVuHwlVP
         LXqs4NlezlpNpgnf2ICZIPxs1kZH1Q2w3d665xzIE95syE+aWcNKLzFWa7YkUbO8Cjlx
         bTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ioxjNilBuiqs0KYw5lDY5ynz4cuTib2XAYQ79MimHtU=;
        fh=Wm1tdfrfu9MgvOCT7w7TPWe8kwc1eeFUskHngePaTyc=;
        b=AhO44vlfxBo7DPZ5cFe81aBMIPLBJQpvgUxyMMW/aarAjCe+i3bla+BWX4tUOWcHfj
         devUa37Kg5VeMTbLwXlIIqOlY7PSnGMTSX+C6ClhkM5fwVu0gnwtxvVPhf7h0i4U5qIQ
         gCXX2ZGij4Wo4I8LTRpriNzM8ZwjTM3P9C2gMqJsILzOk57H7ljE18pvMXUMEi8x43Q4
         0CoTqXo2wML8HvMn18J0bbG1E3JJWa9ZlP3DKTs7S6LV8ItPagZIpJIEkEfhbS/jsrQb
         afaPbulb2sDJbh/Sg7WuDi+7HoPtMZgloSHd7zpJmV2w21U9QeD404tEi5XzdUDGXxEJ
         xMoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id a5-20020a05620a438500b00789e82ef03fsi1936597qkp.540.2024.03.28.09.37.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:37:48 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-d4eypJGsM1OazbUTp-0P0Q-1; Thu,
 28 Mar 2024 12:37:46 -0400
X-MC-Unique: d4eypJGsM1OazbUTp-0P0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 326923C0245F
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:37:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2F353111E404; Thu, 28 Mar 2024 16:37:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE4B41121312;
	Thu, 28 Mar 2024 16:37:42 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 15/26] mm: Export writeback_iter()
Date: Thu, 28 Mar 2024 16:34:07 +0000
Message-ID: <20240328163424.2781320-16-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
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

Export writeback_iter() so that it can be used by netfslib as a module.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox (Oracle) <willy@infradead.org>
cc: Christoph Hellwig <hch@lst.de>
cc: linux-mm@kvack.org
---
 mm/page-writeback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 3e19b87049db..9df160a1cf9e 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2546,6 +2546,7 @@ struct folio *writeback_iter(struct address_space *mapping,
 	folio_batch_release(&wbc->fbatch);
 	return NULL;
 }
+EXPORT_SYMBOL(writeback_iter);
 
 /**
  * write_cache_pages - walk the list of dirty pages of the given address space and write all of them.

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

